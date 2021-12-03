import 'package:flutter/material.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/enums/flavour.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/theme/app_themes.dart';
import 'package:injectable/injectable.dart';

// Global BLoC for controlling the state of configuration
@lazySingleton
class ConfigurationBLoC with ChangeNotifier {
  ConfigurationBLoC({required Flavour flavour}) {
    switch (flavour) {
      case Flavour.flavour_1:
        _flavourTheme = AppTheme.flavour1Theme;
        break;
      case Flavour.flavour_2:
        _flavourTheme = AppTheme.flavour2Theme;
        break;
    }

    _flavour = flavour;
    _flavourThemeData = appThemeData[_flavourTheme]!;
  }

  late ThemeData _flavourThemeData;
  late AppTheme _flavourTheme;
  late Flavour _flavour;

  ThemeData get flavourThemeData => _flavourThemeData;
  AppTheme get flavourTheme => _flavourTheme;
  Flavour get flavour => _flavour;

  Future<void> toggleAppTheme() async {
    switch (_flavourTheme) {
      case AppTheme.flavour1Theme:
        _flavourTheme = AppTheme.flavour2Theme;
        _flavourThemeData = appThemeData[_flavourTheme]!;
        break;
      case AppTheme.flavour2Theme:
        _flavourTheme = AppTheme.flavour1Theme;
        _flavourThemeData = appThemeData[_flavourTheme]!;
        break;
    }
    notifyListeners();
  }
}
