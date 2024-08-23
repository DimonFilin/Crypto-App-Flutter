import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Crypto_list extends StatelessWidget {
  const Crypto_list({
    Key? key,
    required this.coin,
    //required this.theme,
}) : super(key: key);
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageurl, height: 30,
        width: 30,),

      title: Text(coin.name,
          style:
          TextStyle(color: theme.textTheme.bodyMedium?.color)),
      subtitle: Text(
        ("${coin.priceInUSD} \$"),
        style: TextStyle(color: theme.textTheme.bodySmall?.color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: theme.listTileTheme.iconColor,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin.name);
      },
    );
  }
}
