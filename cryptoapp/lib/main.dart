import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/crypto_coins/abstract_coin_reporitry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_list.dart';
import 'package:dio/dio.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker/talker.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("Talker started in main");

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  // Bloc.observer = TalkerBlocObserver(talker: talker);

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoinRepository(dio));
  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  runZonedGuarded(() => runApp(MyApp()), (error, stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);//Ловим ошибки, которые не влетели в bloc
  });
}
