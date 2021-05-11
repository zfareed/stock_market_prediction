import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class StockChart extends StatefulWidget {
  @override
  _StockChartState createState() => _StockChartState();
}

class _StockChartState extends State<StockChart> {
  var themeColor = 0xff344955;

  void callgraphAPI() async {
    var dio = Dio();
    var API_KEY = 'OQ8HZO2HZ3X3XEMI';
    var TICKER = 'TSLA';
    var url = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol='+TICKER+'&apikey='+API_KEY;
    final response = await dio.get(url);
    print(response.statusCode);
    var stockData = response.data;
    print(stockData);
    print(stockData.runtimeType);
    print('\n');

    var stockValues = stockData['Time Series (Daily)'];
    print(stockValues);
    stockValues.forEach((k,v) =>   addgraphData(k, double.parse(v['1. open']))); //print('${k}: ${v['1. open']}'));

  }

  void addgraphData(var date, var open){
    setState(() {
      data.add(_StockData(date, open));
    });


  }

  List<_StockData> data = [
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //callgraphAPI();
  }


  @override
  Widget build(BuildContext context) {

    //graph gradient colors
    final List<Color> color = <Color>[];
    color.add(Colors.orange.shade50);
    color.add(Colors.orange.shade200);
    color.add(Colors.orange.shade300);

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
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Graph'),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_StockData, String>>[
              AreaSeries<_StockData, String>(
                dataSource: data,
                xValueMapper: (_StockData sales, _) => sales.date,
                yValueMapper: (_StockData sales, _) => sales.open,
                gradient: gradientColors,
                borderColor: Colors.orange,
                borderWidth: 3,
              ),
            ]),
      ),
    );
  }
}

class _StockData {
  _StockData(this.date, this.open);

  final String date;
  final double open;
}

