import 'package:flutter/material.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/constants/color_pallete.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/constants/text_styles.dart';

class Flavour1Theme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'SourceSansPro',
      textTheme: const TextTheme(
        bodyText1: kBodyText1,
      ),
      brightness: Brightness.light,
      primaryColor: kMediumElectricBlue,
    );
  }
}
