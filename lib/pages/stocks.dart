import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:stock_market_prediction/components/stockChart.dart';
import 'package:stock_market_prediction/components/stockData.dart';




class StocksRoute extends StatefulWidget {
  @override
  _StockRouteState createState() => _StockRouteState();
}

class _StockRouteState extends State<StocksRoute> {

  TextStyle textStyle1 = TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');
  var themeColor = 0xff344955;





  @override
  Widget build(BuildContext context) {

    TextStyle textStyle1 = TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('STOCKS'),
      ),
      body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                margin: EdgeInsets.all(10.0),
                color: Color(themeColor),
                child: Center(child: Text('Apple Inc [AAPL]', style: TextStyle(fontSize: 50.0, color: Colors.white),)),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StockChart(),
                    StockData()
                  ],
                ),
              )
            ],

          )
      ),
    );
  }


}






