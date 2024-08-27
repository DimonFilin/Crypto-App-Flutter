import 'package:flutter_app/repositories/crypto_coins/models/crypto_coin_advanced_model.dart';

import 'models/models.dart';

abstract class AbstractCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinAdvanced> getAdvancedCoinInfo(String name);
}