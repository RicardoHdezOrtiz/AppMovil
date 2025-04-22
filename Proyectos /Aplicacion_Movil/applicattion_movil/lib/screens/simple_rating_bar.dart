import 'package:flutter/material.dart';


class SimpleRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: Color(0xFFFFBA00),
          size: 18,
        ),
      ),
    );
  }
}