import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;

  const CounterWidget({
    super.key,
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseClicked,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseClicked,
            child: Icon(Icons.remove, color: Colors.white),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 30, // ancho fijo para evitar movimiento del número
            child: Text(
              '$currentCount',
              style: textStyle,
              textAlign: TextAlign.center, // centrado del número
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: Icon(Icons.add, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}