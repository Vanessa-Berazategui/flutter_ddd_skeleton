import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/assets/assets.gen.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/blocs/configuration_bloc.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/enums/flavour.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/lang/l10n.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/routes/router.gr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(Flavour flavour) async {
  //! Load services
  await GlobalConfiguration().loadFromPath(Assets.config.services);

  //! Load general conf
  await GlobalConfiguration().loadFromPath(Assets.config.conf);

  //! Set vertical orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) {
      runApp(
        //! Run app
        MultiProvider(
          providers: [
            /// Load global providers
            ChangeNotifierProvider<ConfigurationBLoC>(
              create: (context) => ConfigurationBLoC(flavour: flavour),
            ),
          ],
          child: App(),
        ),
      );
    },
  );
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  //! Load router
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: Provider.of<ConfigurationBLoC>(context).flavourThemeData,
      // List all of the app's supported locales here
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      localizationsDelegates: const [
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (Spanish, in this case).
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
