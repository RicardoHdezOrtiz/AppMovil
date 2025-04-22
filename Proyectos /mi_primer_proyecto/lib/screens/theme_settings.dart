import 'package:flutter/material.dart';

class ThemeSettings {

  static ThemeData? (int opcTheme){
    switch(opcTheme){

      case 0 : return ThemeData.dark();
      case 1 : return ThemeData.dark();
      case 2 : final theme = ThemeData.light().copyWith(
        color
      );

    }

  }
}
