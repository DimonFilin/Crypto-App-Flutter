import 'package:equatable/equatable.dart';

class CryptoCoinAdvanced extends Equatable {
  const CryptoCoinAdvanced(
      this.name,
      this.priceInUSD,
      this.imageurl,
      this.priceHighest24,
      this.priceLowest24,
      this.high24Hour,
      this.low24Hour,
      this.volume24Hour,
      this.volume24HourTo,
      this.change24Hour,
      this.changePct24Hour);

  final String name;
  final double priceInUSD;
  final imageurl;
  final double priceHighest24;
  final double priceLowest24;
  final double high24Hour;
  final double low24Hour;
  final double volume24Hour;
  final double volume24HourTo;
  final double change24Hour;
  final double changePct24Hour;

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        priceInUSD,
        imageurl,
        priceHighest24,
        priceLowest24,
        high24Hour,
        low24Hour,
        volume24Hour,
        volume24HourTo,
        change24Hour,
        changePct24Hour
      ];
}
