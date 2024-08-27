part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCryptoCoin extends CryptoCoinEvent {
  LoadCryptoCoin({required this.coinName});
  final String coinName;

  @override
  List<Object?> get props => [coinName];
}