import 'package:flutter/material.dart';
import 'package:flutter_app/themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'generated/l10n.dart';

void main() => runApp(MyApp());

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
            home: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AdaptiveTheme.of(context).toggleThemeMode();
          },
        ),
        appBar: AppBar(
            title: Text(
          S.of(context).appBarTitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        )),
        body: Container(
          child: ListView.separated(
              separatorBuilder: (context, i) => Divider(
                    color: theme.dividerColor,
                  ),
              itemCount: 10,
              itemBuilder: (context, i) => ListTile(
                    leading: SvgPicture.asset(
                      "assets/cryptologos/bitcoinlogo.svg",
                      height: 30,
                      width: 30,
                    ),
                    title: Text("Bitcoin",
                        style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color)),
                    subtitle: Text(
                      "2000\$",
                      style: TextStyle(color: theme.textTheme.bodySmall?.color),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: theme.listTileTheme.iconColor,
                    ),
                   
                  )),
        ));
  }
}

class CryptoCoinScreen extends StatelessWidget {
  const CryptoCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
