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


  void initializeFlutterFire() async {
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


  @override
  void initState() {
    initializeFlutterFire();
    //getFirebaseData();
    super.initState();
  }








  @override
  Widget build(BuildContext context) {
    final dataRef = FirebaseFirestore.instance.collection('stocks').doc(widget.ticker).collection("sentiments").doc('twitterSentiments');


    return FutureBuilder<DocumentSnapshot>(
      future: dataRef.get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            var pos = data['positive'];
            var neg = data['negative'];
            var neu = data['neutral'];
            String posPersent = "$pos%";
            String negPersent = "$neg%";
            String neuPersent = "$neu%";
            final List<ChartData> chartData = [
              ChartData('Positive', pos, posPersent, Colors.green),
              ChartData('Negative', neg, negPersent,Colors.blue),
              ChartData('Neutral', neu, neuPersent, Colors.red),
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
          return Text('aaa');
        }

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

