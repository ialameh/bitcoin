import 'package:http/http.dart' as http;

class CurrencyBrain {

String url = 'https://rest-sandbox.coinapi.io/v1/exchangerate/BTC?apikey=9050997F-D969-4EDF-9CBE-D1CE58EDAE73';

Future<Map> getResponse() async {
  http.Response response = await http.get(url);
  return {'body': response.body};
}

}