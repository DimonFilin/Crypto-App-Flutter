part of 'crypto_coin_bloc.dart';


abstract class CryptoCoinState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  CryptoCoinLoaded({required this.coin});
  final CryptoCoinAdvanced coin;

  @override
  // TODO: implement props
  List<Object?> get props => [coin];
}



class CryptoCoinLoadingFail extends CryptoCoinState{
  CryptoCoinLoadingFail({required this.exception});
  final Object? exception;

  @override
  // TODO: implement props
  List<Object?> get props => [exception];

}