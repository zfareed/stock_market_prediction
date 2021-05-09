import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockData extends StatefulWidget {
  @override
  _StateStockData createState() => _StateStockData();
}

class _StateStockData extends State<StockData> {
  var themeColor = 0xff344955;
  String _currentPrice = '000.00';
  String _currentChange = '0.0';
  String _volume = '00.0';
  String _prevClose = '00.0';
  String _dayHigh = '00.0';
  String _dayLow = '00.0';
  String _open = '00.0';


  void calltheAPI() async {
    var dio = Dio();
    var API_KEY = 'OQ8HZO2HZ3X3XEMI';
    var TICKER = 'TSLA';
    var url = 'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol='+TICKER+'&apikey='+API_KEY;
    final response = await dio.get(url);
    print(response.statusCode);
    var stockData = response.data;
    print(stockData);
    stockData = stockData['Global Quote'];
    var price = stockData['05. price'];
    var changePrice = stockData['10. change percent'];
    var volume = stockData['06. volume'];
    var prevClose = stockData['08. previous close'];
    var dayHigh = stockData['03. high'];
    var dayLow = stockData['04. low'];
    var open = stockData['02. open'];

    //trim the price and changePrice strings
    price = price.substring(0,6);
    changePrice = changePrice.substring(0,4);
    volume = volume.substring(0,6);
    prevClose = prevClose.substring(0,6);
    dayHigh = dayHigh.substring(0,6);
    dayLow = dayLow.substring(0,6);
    open = open.substring(0,6);


    // print(price);
    // print(changePrice);
    // print(volume);
    // print(prevClose);
    // print(dayHigh);
    // print(dayLow);
    // print(open);

    updateData(price, changePrice, volume, prevClose, dayHigh, dayLow, open);
  }

  void updateData(var price, var changePrice, var volume, var prevClose, var dayHigh, var dayLow, var open ){
    setState(() {
      _currentPrice = price;
      _currentChange = changePrice;
      _volume = volume;
      _prevClose = prevClose;
      _dayHigh = dayHigh;
      _dayLow = dayLow;
      _open = open;
    });
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calltheAPI();
  }





  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 = TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');

    return Container(
    child: Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    side: BorderSide(width: 0.5, color: Colors.white)),
    color: Color(themeColor),
    child: ListView(
    children: [
    Container(
    margin: EdgeInsets.only(top: 20.0),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('\$$_currentPrice', style: TextStyle(fontSize: 40.0, color: Colors.orange, fontWeight: FontWeight.bold, fontFamily: 'Hind'),),
          Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        ),
        Text('($_currentChange%)', style: TextStyle(fontSize: 15.0, color: Color(0xffFF53E81B)),),
        ],
        ),
        ),
        Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Divider(
        color: Colors.white,
        height: 0.5,
        thickness: 0.5,
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Open', style: textStyle1),
        Text('\$$_open',style: textStyle1)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Prev. Close', style: textStyle1),
        Text('\$$_prevClose',style: textStyle1)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Day High', style: textStyle1),
        Text('\$$_dayHigh',style: textStyle1)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Day Low', style: textStyle1),
        Text('\$$_dayLow',style: textStyle1)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Volume', style: textStyle1),
        Text('\$$_volume',style: textStyle1)
        ],
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Exchange', style: textStyle1),
        Text('NASDAQ',style: textStyle1)
        ],
        ),
        ),
        Container(
        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Row(
        children: [
        Center(
        child: ElevatedButton(
        onPressed: () {
        calltheAPI();
        },
        child: Text('API'),
        ),
        )
        ],
        ),
        )
        ],
        ),

        ),
        width: 300,
        height: 500,
        );
          }
        }
