import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const MyButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(text),
    );
  }
}