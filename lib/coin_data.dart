import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static List<DropdownMenuItem<String>> menuItemsAndroid() {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];

    for (String currency in currenciesList) {
      dropDownMenuItems.add(
        DropdownMenuItem(
            child: Text(
              currency,
            ),
            value: currency),
      );
    }
    return dropDownMenuItems;
  }

  static List<Text> menuItemsIOS() {
    List<Text> textList = [];
    for (String currency in currenciesList) {
      textList.add(
        Text(currency),
      );
    }
    return textList;
  }

  static getCurrency(index) {
    return currenciesList[index];
  }}
