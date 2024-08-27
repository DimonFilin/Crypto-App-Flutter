import 'dart:async';
import 'package:flutter_app/repositories/crypto_coins/abstract_coin_reporitry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../repositories/crypto_coins/models/models.dart';
import 'package:equatable/equatable.dart';

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
        emit(CryptoListLoaded(coinsList: CoinsList));
      } catch (e) {
        emit(CryptoListLoadingFail(exception: e));
      } finally {}
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
