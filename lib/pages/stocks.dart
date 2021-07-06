import 'dart:convert';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  bool _initialized = false;
  bool _error = false;
  final dataRef = FirebaseFirestore.instance.collection('stocks').doc("BABA").collection("sentiments").doc('twitterSentiments');
  double positive = 100;
  double negative = 0;
  double neutral = 0;
  String posPersent = "";
  String negPersent = "";
  String neuPersent = "";

  // _StockRouteState(this.posPersent, this.negPersent, this.neuPersent){
  //   posPersent = "$positive%";
  //   negPersent = "$negative%";
  //   neuPersent = "$neutral%";
  //
  // }



  void initializeFlutterFire() async {
    print("initilazi");
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }


  void getFirebaseData(){

    print("getfirebasedata...");
    dataRef.get().then((DocumentSnapshot doc) {
      if(doc.exists) {
        setState(() {
          positive = doc['positive'];
          negative = doc['negative'];
          neutral = doc['neutral'];
          posPersent = "$positive%";
          negPersent = "$negative%";
          neuPersent = "$neutral%";

        });
      }
    });




  }




  @override
  void initState() {
    initializeFlutterFire();
    getFirebaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 =
        TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');


    //chart data
    final List<ChartData> chartData = [
    ChartData('Positive', positive, posPersent, Colors.green),
    ChartData('Negative', negative, negPersent,Colors.blue),
    ChartData('Neutral', neutral, neuPersent, Colors.red),
    ];

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
              height: 600,
              width: double.infinity,
              color: Colors.white,
              child: Container(
                  child: SfCircularChart(
                      legend: Legend(
                        textStyle: TextStyle(
                          fontSize: 20
                        ),
                          isVisible: true,
                          position: LegendPosition.bottom
                      ),
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                          enableSmartLabels: true,
                            dataSource: chartData,
                            pointColorMapper:(ChartData data,  _) => data.color,
                            xValueMapper: (ChartData data, _) => data.label,
                            yValueMapper: (ChartData data, _) => data.value,
                            dataLabelMapper: (ChartData data, _) => data.perscent,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true
                        )
                        )
                      ]
                  )
              ),
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

class ChartData {
  ChartData(this.label, this.value, this.perscent, this.color);
  final String label;
  final double value;
  final String perscent;
  final Color color;

}


