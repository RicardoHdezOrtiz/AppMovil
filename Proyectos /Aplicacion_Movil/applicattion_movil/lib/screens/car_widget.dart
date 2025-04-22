import 'package:flutter/material.dart';
import 'car_entity.dart';
import 'car_details_page.dart'; // Asegúrate de que este import sea correcto

class CarWidget extends StatelessWidget {
  final CarEntity car;

  const CarWidget(this.car, {super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return AspectRatio(
      aspectRatio: 1.25,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = constraints.maxHeight * 0.2;
          final leftPadding = constraints.maxWidth * 0.1;
          final imageWidth = constraints.maxWidth * 0.35;

          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: topPadding),
                decoration: BoxDecoration(
                  color: car.color,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: topPadding,
                        left: leftPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: textStyle.copyWith(fontSize: 20),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$',
                                  style: textStyle.copyWith(fontSize: 16),
                                ),
                                TextSpan(
                                  text: car.price,
                                  style: textStyle.copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 125,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarDetailsPage(car: car),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'COMPRAR',
                                style: TextStyle(
                                  color: car.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: imageWidth,
                    child: Image.network(
                      car.image,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}