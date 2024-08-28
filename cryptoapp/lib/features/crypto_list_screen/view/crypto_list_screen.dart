import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../bloc/crypto_list_bloc.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker/talker.dart';

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
          actions: [IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => TalkerScreen(talker: GetIt.I<Talker>())));}, icon: Icon(Icons.document_scanner_outlined, color: theme.primaryColor,) )],
            title: Text(
          S.of(context).appBarTitle,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        )),
        body: RefreshIndicator(
          onRefresh: () async {
            //final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList());
            //return completer.future;
          },
          color: theme.primaryColor,
          backgroundColor: theme.dividerColor,
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
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
              if (state is CryptoListLoadingFail) {
                return Center(
                    child: Column(
                  children: [
                    Text(state.exception?.toString() ??
                        S.of(context).ErrorText1),
                    OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList());
                        },
                        child: Text(S.of(context).ErrorText2),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              theme.primaryColor),
                        ))
                  ],
                ));
              }
              return Center(
                child: CircularProgressIndicator(
                    color: theme.textTheme.bodyLarge!.color),
              );
            },
          ),
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
