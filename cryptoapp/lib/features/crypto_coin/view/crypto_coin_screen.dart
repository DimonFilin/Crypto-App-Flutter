import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import '../../../generated/l10n.dart';




class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String ?CoinName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String , 'Args is not string');
    /*if(args == null){
      print('args null extension');
      return;
    }
    else{
      if(args is! String){
        print('args isnt string');
        return;
      }
    }*/
    setState(() {
      CoinName = args as String;
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(CoinName ??  '...')),
    );
  }
}
