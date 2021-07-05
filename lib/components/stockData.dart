import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockData extends StatefulWidget {
  @override
  _StateStockData createState() => _StateStockData();

  String ticker;

  StockData(this.ticker);
}

class _StateStockData extends State<StockData> {
  var themeColor = 0xff344955;
  // String _currentPrice = '000.00';
  // String _currentChange = '0.0';
  // String _volume = '00.0';
  // String _prevClose = '00.0';
  // String _dayHigh = '00.0';
  // String _dayLow = '00.0';
  // String _open = '00.0';

  var stock_data = {'price' : '20', 'change' : '2'};

  Future<Data> getData() async {
      var dio = Dio();
      var API_KEY = 'OQ8HZO2HZ3X3XEMI';
      var TICKER = widget.ticker;
      var url =
          'https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=' +
              TICKER +
              '&apikey=' +
              API_KEY;

      print("Stock Data...");
      final response = await dio.get(url);
      var stockData = response.data;
      stockData = stockData['Global Quote'];
        var price = stockData['05. price'];
        var changePrice = stockData['10. change percent'];
        var volume = stockData['06. volume'];
        var prevClose = stockData['08. previous close'];
        var dayHigh = stockData['03. high'];
        var dayLow = stockData['04. low'];
        var open = stockData['02. open'];

        //trim the strings
        price = price.substring(0, 6);
        changePrice = changePrice.substring(0, 4);
        volume = volume.substring(0, 6);
        prevClose = prevClose.substring(0, 6);
        dayHigh = dayHigh.substring(0, 6);
        dayLow = dayLow.substring(0, 6);
        open = open.substring(0, 6);

      Data mydata = new Data(price, changePrice, volume, prevClose, dayHigh, dayLow, open);

      return mydata;
  }

  Color getColor(number) {
    var num = double.parse(number);
    if(num > 0) return Colors.lightGreenAccent;
    else return Colors.redAccent;
  }




  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 =
    TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'Hind');

    return Container(
      width: 300,
      height: 500,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(width: 0.5, color: Colors.white)),
        color: Color(themeColor),
        child: FutureBuilder<Data>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              Data data = snapshot.data!;
              return Container(
                  child: ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '\$${data.currentPrice}',
                                      style: TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Hind'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 2),
                                    ),
                                    Text(
                                      '(${data.currentChange}%)',
                                      style:
                                          TextStyle(fontSize: 15.0, fontFamily: 'Hind',color: getColor(data.currentChange)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                child: Divider(
                                  color: Colors.white,
                                  height: 0.5,
                                  thickness: 0.5,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Open', style: textStyle1),
                                    Text('\$${data.open}', style: textStyle1)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Prev. Close', style: textStyle1),
                                    Text('\$${data.prevClose}', style: textStyle1)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Day High', style: textStyle1),
                                    Text('\$${data.dayHigh}', style: textStyle1)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Day Low', style: textStyle1),
                                    Text('\$${data.dayLow}', style: textStyle1)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Volume', style: textStyle1),
                                    Text('\$${data.volume}', style: textStyle1)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Exchange', style: textStyle1),
                                    Text('NASDAQ', style: textStyle1)
                                  ],
                                ),
                              ),
                                      ],
                                      )

              );
            } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }






}






class Data{
  var currentPrice;
  var currentChange;
  var volume;
  var prevClose;
  var dayHigh;
  var dayLow;
  var open;

  Data(this.currentPrice, this.currentChange, this.volume, this.prevClose,
      this.dayHigh, this.dayLow, this.open);
}
