import 'package:flutter_app/repositories/crypto_coins/abstract_coin_reporitry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.coinRepository) : super(CryptoCoinInitial()) {
    on<LoadCryptoCoin>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        debugPrint("Вызван новый state");
        final CoinInfo = await coinRepository.getAdvancedCoinInfo(event.coinName);
        emit(CryptoCoinLoaded(coin: CoinInfo));
      } catch (e, st) {
        emit(CryptoCoinLoadingFail(exception: e));
        GetIt.I<Talker>().handle(e,st, "Exception in CryptoCoinScreenBloC");
      }
    });
  }

  final AbstractCoinsRepository coinRepository;
}