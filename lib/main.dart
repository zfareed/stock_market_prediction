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
  int _selectedIndex = 11;
  int _currentPage = 1;
  List<String> stockTickers = ['AAPL', 'GOOG', 'MSFT', 'TSLA', 'AMZN', 'NFLX', 'FB', 'WMT', 'NVDA', 'BABA'];
  List<String> stockCompanies = ['Apple Inc. (AAPL)', 'Alphabet Inc. (GOOG)', 'Microsoft Corporation (MSFT)', 'Tesla, Inc. (TSLA)',
  'Amazon.com, Inc. (AMZN)', 'Netflix, Inc. (NFLX)', 'Facebook, Inc. (FB)', 'Walmart Inc. (WMT)', 'NVIDIA Corporation (NVDA)'
  'Alibaba Group Holding Limited (BABA)'];

  final List<Widget> _pages = [
    HomeRoute(),
    StocksRoute('TICKER', 'COMPANY'),
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
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Center(child: Text('Stock Market\n Prediction', style: TextStyle(color: Colors.white, fontSize: 30.0,),)),
                      SizedBox(height: 10,),
                      Divider(height: 0.5,thickness: 0.5,color: Colors.white,)
                    ],
                  ),

                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                    title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 20),),
                    selected: _selectedIndex == 11,
                    onTap: () => selectDestination(11),
                  ),
                // ExpansionTile(
                //   maintainState: false,
                //   tilePadding: EdgeInsets.only(left: 80),
                //   title: Text('Stocks', style: TextStyle(color: Colors.white, fontSize: 20),),
                //   children: [
                //     Container(
                //       height: 300,
                //       child: ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: stockTickers.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return ListTile(
                //             contentPadding: EdgeInsets.only(left: 140),
                //             selectedTileColor: Color(0xfff9aa33),
                //             title: Text(stockTickers[index], style: TextStyle(color: Colors.white, fontSize: 15),),
                //             selected: index == _selectedIndex,
                //             onTap: () => selectDestination(index),
                //           );
                //         },
                //       ),
                //     )
                //   ],
                // ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                  title: Text('News', style: TextStyle(color: Colors.white, fontSize: 20),),
                  selected: _selectedIndex == 12,
                  onTap: () => selectDestination(12),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 80),
                  selectedTileColor: Color(0xfff9aa33),
                  title: Text('About Us', style: TextStyle(color: Colors.white, fontSize: 20),),
                  selected: _selectedIndex == 13,
                  onTap: () => selectDestination(13),
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
      _selectedIndex = index;
    });
    switch(_selectedIndex)
    {
      case 0:
        setState(() {
          _pages[1] = StocksRoute(stockTickers[index], stockCompanies[index]);
          _currentPage = 1; //open the stock page
        });
        break;
      case 1:
        setState(() {
          _pages[1] = StocksRoute(stockTickers[index], stockCompanies[index]);
          _currentPage = 1;  //open the stock page
        });
        break;
      case 2:
        setState(() {
          _pages[1] = StocksRoute(stockTickers[index], stockCompanies[index]);
          _currentPage = 1; //open the stock page
        });
        break;
      case 3:
        //
      case 11:
        setState(() {
          _currentPage = 0; //open the home page
        });
        break;
      case 12:
        setState(() {
          _currentPage = 0; //open the news page
        });
        break;
      case 13:
        setState(() {
          _currentPage = 0; //open the About Us page
        });
        break;

    }
  }
}






