import 'package:bitcoin_ticker/currency_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD';
  Map  rates  = {'BTC' : '?', 'ETH' : '?', 'ELT' : '?'};
  Widget getPicker() {
    Widget selectedPicker;
    try {
      if (Platform.isIOS) {
        selectedPicker = iosPicker();
      } else if (Platform.isAndroid) {
        selectedPicker = androidPicker();
      }
    } catch (e) {
      selectedPicker = androidPicker();
    }
    return selectedPicker;
  }

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        selectedValue = CoinData.getCurrency(value);
        getRates(selectedValue);
        setState(() {
          selectedValue = CoinData.getCurrency(value);
        });
      },
      children: CoinData.menuItemsIOS(),
    );
  }

  DropdownButton androidPicker() {
    return DropdownButton(
        value: selectedValue,
        items: CoinData.menuItemsAndroid(),
        onChanged: (value) {
          getRates(value);
          setState(() {
            selectedValue = value;
          });
        });
  }
  void getRates(String currency) async {
    dynamic response = await CurrencyBrain().getResponse(currency);
    setState(() {
      rates = response;
    });
  }

  @override
  void initState()  {
    super.initState();
    getRates('USD');
  }
  @override
  Widget build(BuildContext context) {
    print(rates.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  ('BTC ${rates['BTC']}'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
