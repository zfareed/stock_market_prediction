import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:stock_market_prediction/NewsApiData.dart';
import 'package:http/http.dart' as http;


class StockNews extends StatefulWidget {

  @override
  _StockNewsState createState() => _StockNewsState();
}

class _StockNewsState extends State<StockNews> {

  Future<List<News>> _getNews() async {

    var url = Uri.parse('https://financialmodelingprep.com/api/v3/stock_news?tickers=AAPL&limit=5&apikey=004e65b4047483275d6a8362b04edb0e');
    final response = await http.get(url);

    print(response.statusCode);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new News.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }

  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child:  Column(
            children: [
              FutureBuilder<List<News>>(
                future: _getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<News> data = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap:true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data[index].title,
                                style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                )),
                            subtitle: Text(data[index].text, style: TextStyle(color: Colors.white),),
                            leading: Image.network(data[index].image)
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),

            ],
          ),


        ),
      );


  }
}


class News {
  var title;
  var image;
  var text;
  var url;

  News({this.title, this.image, this.text, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      image: json['image'],
      text: json['text'],
      url: json['url'],
    );
  }
}

