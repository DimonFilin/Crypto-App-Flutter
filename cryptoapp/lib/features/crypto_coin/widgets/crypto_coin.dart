import 'package:flutter/material.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Crypto_Coin extends StatelessWidget {
  const Crypto_Coin({
    Key? key,
    required this.coin,
    //required this.theme,
  }) : super(key: key);
  final CryptoCoinAdvanced coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
     // color: Colors.grey[1000],
        child: Column(
      children: [
        SizedBox(height: 12),
        Image.network(
          coin.imageurl,
          height: 300,
          width: 300,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            coin.name,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                S.of(context).price + coin.priceInUSD.toStringAsFixed(2).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).priceH24 + coin.priceHighest24.toStringAsFixed(2).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).priceL24 + coin.priceLowest24.toStringAsFixed(2).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).volume24 + coin.volume24Hour.toStringAsFixed(2).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).volume24To + coin.volume24HourTo.toStringAsFixed(2).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).change24 + coin.change24Hour.toStringAsFixed(4).toString(),
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                S.of(context).changePct24 + coin.changePct24Hour.toStringAsFixed(4).toString(),
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
