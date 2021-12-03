import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/theme/flavour_1_theme.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/theme/flavour_2_theme.dart';

enum AppTheme { flavour1Theme, flavour2Theme }

final appThemeData = {
  AppTheme.flavour1Theme: Flavour1Theme.theme,
  AppTheme.flavour2Theme: Flavour2Theme.theme,
};
