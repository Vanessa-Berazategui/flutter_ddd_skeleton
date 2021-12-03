import 'package:flutter/cupertino.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/assets/assets.gen.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/enums/flavour.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/injection/injection.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/main_common.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  //! Enable remote testing
  enableFlutterDriverExtension();

  //! Init flutter Biding
  WidgetsFlutterBinding.ensureInitialized();

  //! Load log level
  Logger.level = Level.info;

  //! Load environment conf
  await GlobalConfiguration()
      .loadFromPath(Assets.config.flavour.flavour1.testEnvironment);

  //! Load dependencies injections
  configureInjection();

  await mainCommon(Flavour.flavour_1);
}
