import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CardTemp extends StatelessWidget {
  final String temp; // final pq o valor n muda(n existe final em stateful)
  final String description;
  final String city;
  final String time;

  const CardTemp({
    super.key,
    required this.temp,
    required this.time,
    required this.description,
    required this.city,
  });

  /*String getWeatherImagePath() {
    if (description.toLowerCase().contains('sol')) {
      return 'assets/images/clear_day.svg';
    } else if (description.toLowerCase().contains('chuva')) {
      return 'assets/images/rain.svg';
    } else if (description.toLowerCase().contains('nuvem')) {
      return 'assets/images/cloud.svg';
    } else {
      return 'assets/images/cloudly_day.svg';
    }
  }*/

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
              //SvgPicture.asset(
              // getWeatherImagePath(),
              // height: 50,
              // width: 50,
              //),
              Text(
                '$temp°C', // recebe o calor da temperatura da api --- obs: usei interpolação para conseguir usar o °C
                style: const TextStyle(
                  fontSize: 32, // alterar tamanho da letra
                  fontWeight: FontWeight.bold, // alterar fonte da letra
                ),
              ),
              Text(
                time, // recebe a hora da api
                style: const TextStyle(
                  fontSize: 15, // alterar tamanho da letra
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
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
