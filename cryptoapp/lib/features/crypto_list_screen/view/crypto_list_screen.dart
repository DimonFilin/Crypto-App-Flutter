import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';
import '../widgets/widgets.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AdaptiveTheme.of(context).toggleThemeMode();
          },
        ),
        appBar: AppBar(
            title: Text(
              S.of(context).appBarTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )),
        body: Container(
          child: ListView.separated(
              separatorBuilder: (context, i) => Divider(
                color: theme.dividerColor,
              ),
              itemCount: 10,
              itemBuilder: (context, i) {
                final CoinName = 'Bitcoin';
                return Crypto_list(CoinName: CoinName);
              }),
        ));
  }
}