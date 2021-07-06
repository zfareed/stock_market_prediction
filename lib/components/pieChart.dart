import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class PieChart extends StatefulWidget {
  @override
  _PieChartState createState() => _PieChartState();
  String ticker;
  PieChart(this.ticker);

}

class _PieChartState extends State<PieChart> {
  bool _initialized = false;
  bool _error = false;

  final dataRef = FirebaseFirestore.instance.collection('stocks').doc("AAPL").collection("sentiments").doc('twitterSentiments');
  double positive = 100;
  double negative = 0;
  double neutral = 0;
  String posPersent = "";
  String negPersent = "";
  String neuPersent = "";



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

    //chart data
    final List<ChartData> chartData = [
      ChartData('Positive', positive, posPersent, Colors.green),
      ChartData('Negative', negative, negPersent,Colors.blue),
      ChartData('Neutral', neutral, neuPersent, Colors.red),
    ];

    return Container(
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

