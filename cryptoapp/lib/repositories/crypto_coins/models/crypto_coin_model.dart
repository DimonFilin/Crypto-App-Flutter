import 'package:equatable/equatable.dart';
class CryptoCoin extends Equatable {
  const CryptoCoin(this.name, this.priceInUSD, this.imageurl);

  final String name;
  final double priceInUSD;
  final imageurl;

  @override
  // TODO: implement props
  List<Object?> get props => [name,priceInUSD,imageurl];
}
