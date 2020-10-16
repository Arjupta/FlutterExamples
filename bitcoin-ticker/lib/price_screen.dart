import 'package:bitcoin_ticker/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String BTC, ETH, LTC;
  List<String> list = currenciesList;

  DropdownButton getDropdownButton() {
    List<DropdownMenuItem> getDropDownItems() {
      List<DropdownMenuItem> itemList = [];
      for (String currency in list) {
        itemList.add(DropdownMenuItem(child: Text(currency), value: currency));
      }
      return itemList;
    }

    return DropdownButton(
      value: selectedCurrency,
      items: getDropDownItems(),
      onChanged: (val) {
        print(val);
        setState(() {
          selectedCurrency = val;
          getValues();
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Widget> getPickerItems() {
      List<Widget> itemList = [];
      for (String currency in list) {
        itemList.add(Text(currency));
      }
      return itemList;
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        print(index);
        setState(() {
          selectedCurrency = list[index];
          getValues();
        });
      },
      children: getPickerItems(),
    );
  }

  void getValues() async {
    Networking coinApi = Networking();
    double response;
    response = await coinApi.getBTC(selectedCurrency);
    BTC = response.toStringAsPrecision(7);
    response = await coinApi.getETH(selectedCurrency);
    ETH = response.toStringAsPrecision(7);
    response = await coinApi.getLTC(selectedCurrency);
    LTC = response.toStringAsPrecision(7);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    BTC = "?";
    ETH = "?";
    LTC = "?";
    getValues();
  }

  @override
  Widget build(BuildContext context) {
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
                  '1 LTC = $LTC $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 ETH = $ETH $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 BTC = $BTC $selectedCurrency',
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
            child:
                (Platform.isIOS) ? getCupertinoPicker() : getDropdownButton(),
          )
        ],
      ),
    );
  }
}
