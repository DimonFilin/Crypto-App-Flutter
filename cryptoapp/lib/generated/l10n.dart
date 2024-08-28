// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Crypto App`
  String get appBarTitle {
    return Intl.message(
      'Crypto App',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Main fjdfkjdkf`
  String get MainTitle {
    return Intl.message(
      'Main fjdfkjdkf',
      name: 'MainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get ErrorText1 {
    return Intl.message(
      'Something went wrong',
      name: 'ErrorText1',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get ErrorText2 {
    return Intl.message(
      'Try again',
      name: 'ErrorText2',
      desc: '',
      args: [],
    );
  }

  /// `Price: `
  String get price {
    return Intl.message(
      'Price: ',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Highest price per 24 hour: `
  String get priceH24 {
    return Intl.message(
      'Highest price per 24 hour: ',
      name: 'priceH24',
      desc: '',
      args: [],
    );
  }

  /// `Lowest price per 24 hour: `
  String get priceL24 {
    return Intl.message(
      'Lowest price per 24 hour: ',
      name: 'priceL24',
      desc: '',
      args: [],
    );
  }

  /// `Volume per 24 hours: `
  String get volume24 {
    return Intl.message(
      'Volume per 24 hours: ',
      name: 'volume24',
      desc: '',
      args: [],
    );
  }

  /// `Volume per 24 hours (To): `
  String get volume24To {
    return Intl.message(
      'Volume per 24 hours (To): ',
      name: 'volume24To',
      desc: '',
      args: [],
    );
  }

  /// `Change per 24 hours: `
  String get change24 {
    return Intl.message(
      'Change per 24 hours: ',
      name: 'change24',
      desc: '',
      args: [],
    );
  }

  /// `Change Pct per 24 hours: `
  String get changePct24 {
    return Intl.message(
      'Change Pct per 24 hours: ',
      name: 'changePct24',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
