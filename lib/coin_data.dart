import 'package:http/http.dart';

// convert JSON data by jsonDecode()
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
  'LTC',
];

const apiKey = "*****************************************";
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  //create getCoinData() to return the price data(Future)
  Future getCoinData() async {
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';

    //Make a get request to URL and wait for the response
    Response response = await get(requestURL);

    //checking whether the request was successful or not
    if (response.statusCode == 200) {
      //using dart:convert to decode JSON data from the response
      var decodedData = jsonDecode(response.body);
      //get the last price of bitcoin with the key 'rate'.
      var price = decodedData['rate'];
      print(price);
      // Output the lastPrice from the method.
      return price;
      
    } else {
      //handle errors occurs during the request
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
