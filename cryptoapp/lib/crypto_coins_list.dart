import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routs.dart';
import 'package:flutter_app/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'generated/l10n.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        initial: AdaptiveThemeMode.dark,
        builder: (dark, light) => MaterialApp(
              theme: light,
              darkTheme: dark,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              title: 'Flutter Demo',
              routes: routes,
          navigatorObservers: [
            TalkerRouteObserver(GetIt.I<Talker>())
          ],
            ));
    // home: CryptoListScreen()));
  }
}
