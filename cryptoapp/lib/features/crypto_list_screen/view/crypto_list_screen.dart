import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';
import '../widgets/widgets.dart';
import 'package:flutter_app/repositories/crypto_coins/crypto_coins_repository.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _CryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  Future <void> _loadCryptoCoins() async{
    //  AdaptiveTheme.of(context).toggleThemeMode();
    _CryptoCoinsList = await CryptoCoinRepository().getCoinsList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(
          S.of(context).appBarTitle,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        )),
        body: _CryptoCoinsList == null
            ? const Center(child: CircularProgressIndicator(),)
            : Container(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 20),
                    separatorBuilder: (context, i) => Divider(
                          color: theme.dividerColor,
                        ),
                    itemCount: _CryptoCoinsList!.length,
                    itemBuilder: (context, i) {
                     final coin = _CryptoCoinsList![i];
                     final coinName = coin.name;

                      return Crypto_list(coin: coin);
                    }),
              ));
  }
}
