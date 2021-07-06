import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_market_prediction/components/pieChart.dart';
import 'package:stock_market_prediction/components/stockNews.dart';
import 'package:stock_market_prediction/components/stockChart.dart';
import 'package:stock_market_prediction/components/stockData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class StocksRoute extends StatefulWidget {
  @override
  _StockRouteState createState() => _StockRouteState();

  String ticker;
  String company;

  StocksRoute(this.ticker, this.company);
}

class _StockRouteState extends State<StocksRoute> {
  TextStyle textStyle1 =
      TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');
  var themeColor = 0xff344955;


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 =
        TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('STOCKS'),
      ),
      body: SingleChildScrollView(
        child: Container(
            //SingleChildScrollView
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              margin: EdgeInsets.all(10.0),
              color: Color(themeColor),
              child: Center(
                  child: Text(
                widget.company,
                style: TextStyle(fontSize: 50.0, color: Colors.white),
              )),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 5, child: StockChart(widget.ticker)),
                  Expanded(flex: 2, child: StockData(widget.ticker)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 500,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('Twitter Sentiment Analysis', style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  PieChart(widget.ticker),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    'Recent News',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  StockNews(widget.ticker)
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}



