import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/assets/assets.gen.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/enums/flavour.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/injection/injection.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/main_common.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  // This line enables the extension
  enableFlutterDriverExtension();

  //! Load log level
  Logger.level = Level.verbose;

  //! Load environment conf
  await GlobalConfiguration()
      .loadFromPath(Assets.config.flavour.flavour1.devEnvironment);

  //! Load dependencies injections
  configureInjection();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  await mainCommon(Flavour.flavour_1);
}
