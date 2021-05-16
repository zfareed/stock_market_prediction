import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:stock_market_prediction/NewsApiData.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class StockNews extends StatefulWidget {

  @override
  _StockNewsState createState() => _StockNewsState();
}

class _StockNewsState extends State<StockNews> {

  Future<List<News>> _getNews() async {

    var url = Uri.parse('https://financialmodelingprep.com/api/v3/stock_news?tickers=TSLA&limit=5&apikey=004e65b4047483275d6a8362b04edb0e');
    final response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new News.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }

  }

  _launchURL(var url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url error';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child:  FutureBuilder<List<News>>(
            future: _getNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<News> data = snapshot.data!;
                return ListView.builder(
                    shrinkWrap:true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 150, right: 150,top: 30),
                        width: double.infinity,
                        child: InkWell(
                          hoverColor: Colors.white10,
                          onTap: (){_launchURL(data[index].url);},
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Image.network(data[index].image, height: 130, width: 231,),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(data[index].title, overflow: TextOverflow.clip, style: TextStyle(color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold,),),
                                        SizedBox(height: 8,),
                                        Text(data[index].text, style: TextStyle(color: Colors.grey.shade200, fontSize: 15.0),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Divider(height: 0.5, thickness: 0.5, color: Colors.grey.shade200,),
                              )
                            ],
                          ),
                        ),

                      );

                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),


        ),
      );


  }
}


