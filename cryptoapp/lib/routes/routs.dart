import 'package:flutter/material.dart';

import '../features/crypto_coin/view/crypto_coin_screen.dart';
import '../features/crypto_list_screen/view/crypto_list_screen.dart';

final routes = {
'/': (context) => CryptoListScreen(),
'/coin': (context) => CryptoCoinScreen()
};