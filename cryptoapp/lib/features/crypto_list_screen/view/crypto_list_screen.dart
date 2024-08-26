import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../bloc/crypto_list_bloc.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  // Future <void> _loadCryptoCoins() async{
  //   //  AdaptiveTheme.of(context).toggleThemeMode();
  //   _CryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(
          S.of(context).appBarTitle,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        )),
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return Container(
                child: ListView.separated(
                    padding: EdgeInsets.only(top: 20),
                    separatorBuilder: (context, i) => Divider(
                          color: theme.dividerColor,
                        ),
                    itemCount: state.coinsList.length,
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];
                      final coinName = coin.name;

                      return Crypto_list(coin: coin);
                    }),
              );
            }
            if(state is CryptoListLoadingFail)
              {return Center(child: Text(state.exeption?.toString() ?? 'Ошибка без перевода в текст, ожидайте фикса'));}
            return Center(
              child: CircularProgressIndicator(
                  color: theme.textTheme.bodyLarge!.color),
            );
          },
        ));
    // _CryptoCoinsList == null
    //     ?  Center(child: CircularProgressIndicator(color: theme.textTheme.bodyLarge!.color),)
    //     : Container(
    //         child: ListView.separated(
    //           padding: EdgeInsets.only(top: 20),
    //             separatorBuilder: (context, i) => Divider(
    //                   color: theme.dividerColor,
    //                 ),
    //             itemCount: _CryptoCoinsList!.length,
    //             itemBuilder: (context, i) {
    //              final coin = _CryptoCoinsList![i];
    //              final coinName = coin.name;
    //
    //               return Crypto_list(coin: coin);
    //             }),
    //       ));
  }
}
