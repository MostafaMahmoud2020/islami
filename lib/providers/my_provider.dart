import 'package:flutter/material.dart';

import '../myThemeData.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode modeApp = ThemeMode.light;
  late bool iconFlag = true;

  changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  changeTheme(ThemeMode mode) {
    modeApp = mode;
    notifyListeners();
  }

  String changeBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/background.png";
    } else {
      return "assets/images/dark_background.png";
    }
  }

  String changeSebhaBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/sebha_image.png";
    } else {
      return "assets/images/dark_sebha.png";
    }
  }

  Color changeColor() {
    if (modeApp == ThemeMode.light) {
      return MyThemeData.primaryColor;
    } else {
      return MyThemeData.darkBluePrimaryColor;
    }
  }
}
