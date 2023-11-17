import 'package:flutter/material.dart';

class CardClima extends StatelessWidget {
  final String temp; // final pq o valor n muda(n existe final em stateful)
  final String description;
  final String city;

  const CardClima({
    super.key,
    required this.temp,
    required this.description,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3, // sombra do card
        shape: RoundedRectangleBorder(
          // formato do primeiro card (Dollar)
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          // conteudo do card
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                temp, // recebe o calor da temperatura da api
                style: const TextStyle(
                  fontSize: 32, // alterar tamanho da letra
                  fontWeight: FontWeight.bold, // alterar fonte da letra
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description, //  a variavel description recebe o valor da api(no caso a descrição do clima),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                city, // a variavel city recebe o valor da api(no caso o nome da cidade)
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
