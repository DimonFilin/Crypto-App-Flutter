import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/crypto_coins/abstract_coin_reporitry.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_list.dart';
import 'package:dio/dio.dart';
import 'repositories/crypto_coins/crypto_coins_repository.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => CryptoCoinRepository(Dio()));
  runApp(MyApp());
}
