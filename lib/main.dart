import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'widgets/card_temp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeMaterial(),
    );
  }
}

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  late Future<Map<String, dynamic>> dadosClima;

  @override
  void initState() {
    super.initState();
    dadosClima = getDadosClima();
  }

  Future<Map<String, dynamic>> getDadosClima() async {
    //print("get dados");
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.hgbrasil.com/weather?key=8793346b&city_name=Natal,RN',
        ),
      );

      if (res.statusCode != HttpStatus.ok) {
        throw 'Erro de conexão';
      }

      final data = jsonDecode(res.body);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: dadosClima, // dadosDollar
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final data = snapshot.data!;

            final dadosClima = data['results'];
            //final lista = data['results']['currencies'].values.toList();
            //final listaStocks = data['results']['stocks'].values.toList();
            //lista.removeAt(0);
            //lista.removeAt(0);
            //print(listaBolsas);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CardTemp(
                      temp: dadosClima['temp'].toString(),
                      time: dadosClima['time'],
                      description: "${dadosClima['description']}",
                      city: "${dadosClima['city']}"),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }),
    );
  }
}
