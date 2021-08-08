import 'package:flutter/material.dart';
import 'coin_data.dart';

String selected_currency = 'USD';
double btc_to_fiat;
double eth_to_fiat;
double doge_to_fiat;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> create_crypto_list(currenciesList) {
      List<DropdownMenuItem> cryptoList = [];
      for (var item in currenciesList) {
        DropdownMenuItem dropdownItem = DropdownMenuItem(
          child: Text(item),
          value: item,
        );
        cryptoList.add(dropdownItem);
      }
      return cryptoList;
    }

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
              color: Color(0xFF548CA8),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $btc_to_fiat $selected_currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF548CA8),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $eth_to_fiat $selected_currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Color(0xFF548CA8),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 DOGE = $doge_to_fiat $selected_currency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Color(0xFF476072),
            child: DropdownButton(
              value: selected_currency,
              items: create_crypto_list(currenciesList),
              onChanged: (value) async {
                selected_currency = value;
                var exchange_rates =
                    await CoinData().get_exchange_rates(selected_currency);
                setState(() {
                  btc_to_fiat = exchange_rates[0];
                  eth_to_fiat = exchange_rates[1];
                  doge_to_fiat = exchange_rates[2];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
