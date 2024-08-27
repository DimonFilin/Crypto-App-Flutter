import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'crypto_coins.dart';

class CryptoCoinRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinRepository(this.dio);

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,AE,GG,fil,ton,dog&tsyms=USD');
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      var price = usdData['PRICE'];
      // price = price.toStringAsPrecision(3);
      final imageurl = usdData['IMAGEURL'];
      return CryptoCoin(
          e.key, price, 'https://www.cryptocompare.com/$imageurl');
    }).toList();
    return dataList;
  }

  @override
  Future<CryptoCoinAdvanced> getAdvancedCoinInfo(String coinName) async {
    final response = await dio.get(
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinName&tsyms=USD");
    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final entry = dataRaw.entries.firstWhere(
          (e) => e.key == coinName,
      orElse: () => throw Exception('Coin not found'),
    );
    final usdData = (entry.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
    var price = usdData['PRICE'];
    final imageurl = usdData['IMAGEURL'];
    final double priceHighest24 = usdData['HIGH24HOUR'];
    final double priceLowest24 = usdData['LOW24HOUR'];
    final double high24Hour = usdData['HIGH24HOUR'];
    final double low24Hour = usdData['LOW24HOUR'];
    final double volume24Hour = usdData['VOLUME24HOUR'];
    final double volume24HourTo = usdData['VOLUME24HOURTO'];
    final double change24Hour = usdData['CHANGE24HOUR'];
    final double changePct24Hour = usdData['CHANGEPCT24HOUR'];

    return CryptoCoinAdvanced(
      entry.key,
      price,
      'https://www.cryptocompare.com/$imageurl',
      priceHighest24,
      priceLowest24,
      high24Hour,
      low24Hour,
      volume24Hour,
      volume24HourTo,
      change24Hour,
      changePct24Hour,
    );
  }
}