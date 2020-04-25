import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyBrain {

String apiKey = '9050997F-D969-4EDF-9CBE-D1CE58EDAE73';
var url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD'; 

var headerString = 'X-CoinAPI-Key';


Future<Map> getResponse() async {
  http.Response response = await http.get(url, headers: {headerString : apiKey });
  var responseData = jsonDecode(response.body);
  return {'USD': responseData['rate']};
}

}