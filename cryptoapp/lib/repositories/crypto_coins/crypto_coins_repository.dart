import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'models/crypto_coin_model.dart';

class CryptoCoinRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AE,GG,fil,ton,dog&tsyms=USD');
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries
        .map((e) {
          final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          var price = usdData['PRICE'];
         // price = price.toStringAsPrecision(3);
          final imageurl = usdData['IMAGEURL'];
          return CryptoCoin(e.key,price,'https://www.cryptocompare.com/$imageurl' );})
        .toList();
    return dataList;
  }
}
