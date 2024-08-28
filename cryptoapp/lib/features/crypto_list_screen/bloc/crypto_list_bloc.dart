import 'dart:async';
import 'package:flutter_app/repositories/crypto_coins/abstract_coin_reporitry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<CryptoListEvent>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        debugPrint("Вызван новый state");
        final CoinsList = await coinsRepository.getCoinsList();
        //throw Exception("data dont loaded");
        emit(CryptoListLoaded(coinsList: CoinsList));
      } catch (e, st) { //error , stackTrace
        emit(CryptoListLoadingFail(exception: e));
        GetIt.I<Talker>().handle(e,st, "Exception in CryptoListScreenBloC");
      } finally {}
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
