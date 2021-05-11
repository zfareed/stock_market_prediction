// To parse this JSON data, do
//
//     final newsApiData = newsApiDataFromJson(jsonString);

import 'dart:convert';

List<NewsApiData> newsApiDataFromJson(String str) => List<NewsApiData>.from(json.decode(str).map((x) => NewsApiData.fromJson(x)));

String newsApiDataToJson(List<NewsApiData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsApiData {
  NewsApiData({
    required this.symbol,
    required this.publishedDate,
    required this.title,
    required this.image,
    required this.site,
    required this.text,
    required this.url,
  });

  String symbol;
  DateTime publishedDate;
  String title;
  String image;
  String site;
  String text;
  String url;

  factory NewsApiData.fromJson(Map<String, dynamic> json) => NewsApiData(
    symbol: json["symbol"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    title: json["title"],
    image: json["image"],
    site: json["site"],
    text: json["text"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "publishedDate": publishedDate.toIso8601String(),
    "title": title,
    "image": image,
    "site": site,
    "text": text,
    "url": url,
  };
}
