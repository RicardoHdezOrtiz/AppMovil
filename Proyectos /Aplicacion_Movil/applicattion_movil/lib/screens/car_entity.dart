import 'package:flutter/material.dart';

class CarEntity {
  final String name;
  final String image;
  final String price;
  final Color color;

  CarEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
  });
}

final carList = [
  CarEntity(
    name: 'Koenigsegg Jesko',
    image: 'https://www.pngplay.com/wp-content/uploads/13/Koenigsegg-Jesko-PNG-Clipart-Background.png',
    price: '4.3M',
    color: Color.fromARGB(255, 84, 207, 7),
  ),

  CarEntity(
    name: 'Koenigsegg One',
    image: 'https://purepng.com/public/uploads/large/purepng.com-white-koenigsegg-one-1-carcarvehicletransportsports-carkoenigsegg-961524658934opafg.png',
    price: '3.1M',
    color: Color.fromARGB(255, 113, 10, 3),
  ),

  CarEntity(
    name: 'Koenigsegg Jesko',
    image: 'https://www.pngplay.com/wp-content/uploads/13/Koenigsegg-Jesko-PNG-Clipart-Background.png',
    price: '4.3M',
    color: Color.fromARGB(255, 84, 207, 7),
  ),

  CarEntity(
    name: 'Koenigsegg One',
    image: 'https://purepng.com/public/uploads/large/purepng.com-white-koenigsegg-one-1-carcarvehicletransportsports-carkoenigsegg-961524658934opafg.png',
    price: '3.1M',
    color: Color.fromARGB(255, 113, 10, 3),
  ),
];