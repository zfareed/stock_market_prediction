import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;



class StockChart extends StatefulWidget {
  @override
  _StockChartState createState() => _StockChartState();

  String ticker;
  StockChart(this.ticker);
}

class _StockChartState extends State<StockChart> {
  var themeColor = 0xff344955;

  List<_StockData> data = [
  ];

  Future<List<_StockData>> getData() async {

    data.clear();
    var dio = Dio();
    var TICKER = widget.ticker;
    var url = "http://127.0.0.1:5000/stocks/" + TICKER;
    final response = await dio.get(url);
    print("Stock Chart...");


    var stockData = response.data;
    stockData.forEach((k,v) =>   addgraphData(k, v));

    return data;

  }

  void addgraphData(var date, var open){
    data.add(_StockData(date, open));
}


  late CrosshairBehavior crosshair;
  late TrackballBehavior _trackballBehavior;


  @override
  void initState() {
    print("chart initilaze...........");
    super.initState();
    crosshair = CrosshairBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        hideDelay: 2000,
        shouldAlwaysShow: false,
        lineType: CrosshairLineType.both,
        lineWidth: 1
    );
    _trackballBehavior = TrackballBehavior(
      lineWidth: 0,
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(
        enable: true,
        borderWidth: 0,
        color: Colors.orange,
        textStyle: TextStyle(fontSize: 15, color: Colors.white)
      )
    );
  }


  @override
  Widget build(BuildContext context) {

    //graph gradient colors
    final List<Color> color = <Color>[];
    color.add(Colors.blue.shade50);
    color.add(Colors.blue.shade200);
    color.add(Colors.blue.shade300);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
    LinearGradient(colors: color, stops: stops, begin: Alignment.bottomCenter, end: Alignment.topCenter);

    return Container(
      height: 500,
      width: 900,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(width: 0.5, color: Colors.white)),
        color: Color(themeColor),
        child: FutureBuilder<List<_StockData>>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              List<_StockData> data = snapshot.data!;
              return SfCartesianChart(
                crosshairBehavior: crosshair,
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Graph'),
                  // Enable legend
                  legend: Legend(isVisible: false),
                  // Enable tooltip
                  // tooltipBehavior: TooltipBehavior(
                  //     enable: true,
                  //     header: 'Open Price',
                  //     tooltipPosition: TooltipPosition.pointer,
                  // ),
                  trackballBehavior: _trackballBehavior,
                  series: <ChartSeries<_StockData, String>>[
                    AreaSeries<_StockData, String>(
                      dataSource: data,
                      xValueMapper: (_StockData sales, _) => sales.date,
                      yValueMapper: (_StockData sales, _) => sales.open,
                      gradient: gradientColors,
                      borderColor: Colors.blue,
                      borderWidth: 3,
                    ),
                  ]
              );
            }else if (snapshot.hasError) {
                return Text("${snapshot.error}");
    }
              return Center(child: CircularProgressIndicator());
    },


        ),
      ),
    );
  }


}

class _StockData {

  final String date;
  final double open;

  _StockData(this.date, this.open);

}

