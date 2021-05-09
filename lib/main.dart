import 'package:flutter/material.dart';
import 'package:stock_market_prediction/pages/stocks.dart';
import 'pages/news.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Stock Market Prediction';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    theme: ThemeData(
      primaryColor: Color(0xFF6200EE),
      backgroundColor: Color(0xff344955),

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText1: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)
    ),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;
  int _currentPage = 1;
  final List<Widget> _pages = [
    HomeRoute(),
    StocksRoute(),
    NewsRoute()
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Drawer(
          child: Container(
            color: theme.backgroundColor,
            child: ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                    title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 20),),
                    selected: _selectedDestination == 0,
                    onTap: () => selectDestination(0),
                  ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                    title: Text('Stocks', style: TextStyle(color: Colors.white, fontSize: 20),),
                    selected: _selectedDestination == 1,
                    onTap: () => selectDestination(1),
                  ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                  title: Text('News', style: TextStyle(color: Colors.white, fontSize: 20),),
                  selected: _selectedDestination == 2,
                  onTap: () => selectDestination(2),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                  title: Text('About Us', style: TextStyle(color: Colors.white, fontSize: 20),),
                  selected: _selectedDestination == 3,
                  onTap: () => selectDestination(3),
                ),


              ],
            ),
          ),
        ),
        Expanded(child: _pages[_currentPage])
      ],
    );
  }




  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
    switch(_selectedDestination)
    {
      case 0:
        setState(() {
          _currentPage = 0; //open the home page
        });
        break;
      case 1:
        setState(() {
          _currentPage = 1;  //open the stock page
        });
        break;
      case 2:
        setState(() {
          _currentPage = 2; //open the news page
        });
        break;
      case 3:
        //
    }
  }
}






