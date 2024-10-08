part of 'crypto_list_bloc.dart';


abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;

  @override
  // TODO: implement props
  List<Object?> get props => (coinsList);
}



class CryptoListLoadingFail extends CryptoListState{
  CryptoListLoadingFail({required this.exception});
  final Object? exception;

  @override
  // TODO: implement props
  List<Object?> get props => [exception];

}