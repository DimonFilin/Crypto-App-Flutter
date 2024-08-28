import 'package:flutter/material.dart';
import 'package:flutter_app/features/crypto_list_screen/bloc/crypto_list_bloc.dart';
import 'package:get_it/get_it.dart';

//import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../bloc/crypto_coin_bloc.dart';

//import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  late CryptoCoinBloc _cryptoListBloc;

  @override
  void initState() {
    super.initState();
    _cryptoListBloc = CryptoCoinBloc(GetIt.I<AbstractCoinsRepository>());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    debugPrint(args as String?);
    assert(args != null && args is String, 'Args is not string');
    if (args != null && args is String) {
      _cryptoListBloc.add(LoadCryptoCoin(coinName: args));
    }
  }

  //@override
  // void didChangeDependencies() {
  //   // final args = ModalRoute.of(context)?.settings.arguments;
  //   // assert(args != null && args is String, 'Args is not string');
  //   // /*if(args == null){
  //   //   print('args null extension');
  //   //   return;
  //   // }
  //   // else{
  //   //   if(args is! String){
  //   //     print('args isnt string');
  //   //     return;
  //   //   }
  //  //}*/
  //   setState(() {
  //     Coin = ModalRoute.of(context)?.settings.arguments;
  //   });
  //   super.didChangeDependencies();
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
        body: RefreshIndicator(
          onRefresh: () async {
            //final completer = Completer();
            //_cryptoListBloc.add(LoadCryptoCoin());
            //return completer.future;
          },
          color: theme.primaryColor,
          backgroundColor: theme.dividerColor,
          child: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoCoinLoaded) {
                return Container(
                  child: ListView.separated(
                      padding: EdgeInsets.only(top: 20),
                      separatorBuilder: (context, i) => Divider(
                            color: theme.dividerColor,
                          ),
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        final coin = state.coin;
                        final coinName = coin.name;
                        //_cryptoListBloc.add(LoadCryptoCoin(coinName: coinName));
                        return Crypto_Coin(coin: state.coin); //Crypto_list(coin: coin);
                      }),
                );
              }
              if (state is CryptoCoinLoadingFail) {
                return Center(
                    child: Column(
                  children: [
                    Text(state.exception?.toString() ??
                        S.of(context).ErrorText1),
                    OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc
                              .add(LoadCryptoList() as CryptoCoinEvent);
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
  }
}
