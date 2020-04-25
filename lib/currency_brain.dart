import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyBrain {

String apiKey = '7FE38758-6097-434E-86E9-8CF4FBBAAA10';

var headerString = 'X-CoinAPI-Key';


Future<Map> getResponse(String currency) async {
  var url = 'https://rest.coinapi.io/v1/exchangerate'; 
  http.Response btc = await http.get('$url/BTC/$currency', headers: {headerString : apiKey });
  //http.Response eth = await http.get('$url/ETH/$currency', headers: {headerString : apiKey });
  //http.Response ltc = await http.get('$url/LTC/$currency', headers: {headerString : apiKey });
  var btcRate = jsonDecode(btc.body)['rate'].toStringAsFixed(0);
  var ethRate = jsonDecode(btc.body)['rate'].toStringAsFixed(0);
  var ltcRate = jsonDecode(btc.body)['rate'].toStringAsFixed(0);
  return {'BTC': btcRate, 'ETH' : ethRate, 'LTC': ltcRate};

}
}