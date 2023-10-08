import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyect_polaris/src/views/location_view.dart';

import 'views/planet_tourism_view.dart';
import 'views/planet_view.dart';
import 'views/destinations_view.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  final routes = <String, WidgetBuilder>{
    DestinationsView.routeName: (BuildContext context) =>
        const DestinationsView(),
    '${PlanetView.routeName}/Saturn': (BuildContext context) =>
        const PlanetView(
          name: 'Saturn',
        ),
    '${PlanetView.routeName}/Jupiter': (BuildContext context) =>
        const PlanetView(
          name: 'Jupiter',
        ),
    '${PlanetView.routeName}/Neptune': (BuildContext context) =>
        const PlanetView(
          name: 'Neptune',
        ),
    '${PlanetView.routeName}/Mercury': (BuildContext context) =>
        const PlanetView(
          name: 'Mercury',
        ),
    '${PlanetView.routeName}/Venus': (BuildContext context) => const PlanetView(
          name: 'Venus',
        ),
    '${PlanetView.routeName}/Earth': (BuildContext context) => const PlanetView(
          name: 'Earth',
        ),
    '${PlanetView.routeName}/Mars': (BuildContext context) => const PlanetView(
          name: 'Mars',
        ),
    '${PlanetView.routeName}/Uranus': (BuildContext context) =>
        const PlanetView(
          name: 'Uranus',
        ),
    '${PlanetView.routeName}/Pluto': (BuildContext context) => const PlanetView(
          name: 'Pluto',
        ),
    '${PlanetView.routeName}/Sun': (BuildContext context) => const PlanetView(
          name: 'Sun',
        ),
    LocationPage.routeName: (BuildContext context) => const LocationPage(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            routes: routes,
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute<void>(
                settings: settings,
                builder: (BuildContext context) =>
                    const DestinationsView(launchAlert: true),
                fullscreenDialog: true,
              );
            });
      },
    );
  }
}
