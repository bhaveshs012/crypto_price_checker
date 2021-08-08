import 'package:http/http.dart';
import 'dart:convert';

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
  'DOGE',
];

class CoinData {
  CoinData();
  List<double> exchange_rates = [];
  Future get_exchange_rates(String fiat) async {
    for (var crypto in cryptoList) {
      var url = Uri.parse(
          "https://rest.coinapi.io/v1/exchangerate/$crypto/$fiat?apikey={API_KEY}"); // Add your API key here
      Response response = await get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedData = jsonDecode(data);
        double exchange_rate = decodedData['rate'];
        exchange_rates.add(exchange_rate);
      } else {
        return response.statusCode;
      }
    }
    return exchange_rates;
  }
}
