import 'package:flutter/material.dart';
import 'screens/my_home_page.dart'; // importa tu archivo de pantalla


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car App',
      home: MyHomePage(),
    );
  }
}