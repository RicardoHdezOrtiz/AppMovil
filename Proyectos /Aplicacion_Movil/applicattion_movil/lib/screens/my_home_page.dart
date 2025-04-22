import 'package:flutter/material.dart';
import 'car_widget.dart';
import 'car_entity.dart';
import 'dart:ui'; // Para usar el filtro de desenfoque

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KoenigseggStore.com"),
      ),
      body: Stack(
        children: [
          // El contenido principal de la página
          Column(
            children: [
              // Barra superior con el logo y los íconos
              Container(
                height: 42,
                margin: EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://w7.pngwing.com/pngs/183/20/png-transparent-three-dots-zondicons-icon-thumbnail.png',
                      height: 26,
                    ),
                    Text(
                      'Koenigsegg',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                    Image.network(
                      'https://w7.pngwing.com/pngs/554/640/png-transparent-computer-icons-mystery-shopping-shopping-bags-trolleys-shopping-bag-icon-service-rectangle-shopping-bags-trolleys.png',
                      height: 26,
                    ),
                  ],
                ),
              ),
              // Lista de carros
              Expanded(
                child: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: carList.length,
                    itemBuilder: (context, index) {
                      return CarWidget(carList[index]);  // Aquí se pasan los datos de cada carro
                    },
                  ),
                ),
              ),
            ],
          ),
          
          // Barra de navegación inferior con efecto de desenfoque
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 64,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0), // Efecto de desenfoque
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network('https://cdn-icons-png.freepik.com/512/263/263115.png'),
                      Image.network('https://cdn-icons-png.flaticon.com/512/5709/5709487.png'),
                      Image.network('https://cdn-icons-png.flaticon.com/512/1362/1362884.png'),
                      Image.network('https://cdn-icons-png.flaticon.com/512/1361/1361728.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}