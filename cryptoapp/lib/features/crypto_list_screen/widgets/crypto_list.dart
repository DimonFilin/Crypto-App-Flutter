import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Crypto_list extends StatelessWidget {
  const Crypto_list({
    Key? key,
    required this.CoinName,
    //required this.theme,
}) : super(key: key);
  final String CoinName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        "assets/cryptologos/bitcoinlogo.svg",
        height: 30,
        width: 30,
      ),
      title: Text(CoinName,
          style:
          TextStyle(color: theme.textTheme.bodyMedium?.color)),
      subtitle: Text(
        "2000\$",
        style: TextStyle(color: theme.textTheme.bodySmall?.color),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: theme.listTileTheme.iconColor,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: CoinName);
      },
    );
  }
}
