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

