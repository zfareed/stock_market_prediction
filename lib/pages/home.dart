import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.orange,
        //   title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Hind'),),
        //   centerTitle: true,
        // ),
        body: Scrollbar(
          isAlwaysShown: true,
          showTrackOnHover: true,

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                // Container(
                //   height: 70,
                //   width: double.infinity,
                //   color: Colors.black,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       TextButton(onPressed: null, child: Text('Home', style: TextStyle(fontSize: 20, color: Colors.white),)),
                //       TextButton(onPressed: null, child: Text('Stocks', style: TextStyle(fontSize: 20, color: Colors.white),)),
                //       TextButton(onPressed: null, child: Text('News', style: TextStyle(fontSize: 20, color: Colors.white),)),
                //       TextButton(onPressed: null, child: Text('About Us', style: TextStyle(fontSize: 20, color: Colors.white),))
                //
                //
                //
                //     ],
                //   ),
                // ),
                Container(
                  height: 600.0,
                  width: double.infinity,
                  //color: Colors.redAccent,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.color),
                      image: AssetImage("images/stockBackground.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   color: Colors.black.withOpacity(0.5),
                      //   height: 60,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       TextButton(onPressed: null, child: Text('Home', style: TextStyle(fontSize: 25, color: Colors.white),)),
                      //       TextButton(onPressed: null, child: Text('Stocks', style: TextStyle(fontSize: 25, color: Colors.white),)),
                      //       TextButton(onPressed: null, child: Text('News', style: TextStyle(fontSize: 25, color: Colors.white),)),
                      //       TextButton(onPressed: null, child: Text('About Us', style: TextStyle(fontSize: 25, color: Colors.white),)),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 150,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('The Stock Master', style: TextStyle(color: Colors.white, fontSize: 40.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text('A tool to help you when is the\ngood time to buy or sell stocks', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade200,
                          Colors.white,
                        ],
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 25, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('What is stock market?', style: TextStyle(color: Colors.black, fontSize: 40),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text('A stock market, equity market, or share market is the aggregation of buyers and '
                              'sellers of stocks (also called shares), which represent ownership claims on businesses; '
                              'these may include securities listed on a public stock exchange, as well as stock that is '
                              'only traded privately, such as shares of private companies which are sold to investors '
                              'through equity crowdfunding platforms. Investment in the stock market is most often done'
                              ' via stockbrokerages and electronic trading platforms. Investment is usually made with '
                              'an investment strategy in mind.', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text('Why predict stock market?', style: TextStyle(color: Colors.black, fontSize: 40),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text('Stock market prediction aims to determine the future movement of the stock value '
                              'of a financial exchange. The accurate prediction of share price movement will lead to more'
                              ' profit investors can make. Predicting how the stock market will move is one of the most '
                              'challenging issues due to many factors that involved in the stock prediction, such as interest '
                              'rates, politics, and economic growth that make the stock market volatile and very hard to '
                              'predict accurately. The prediction of shares offers huge chances for profit and is a major'
                              ' motivation for research in this area; knowledge of stock movements by a fraction of a '
                              'second can lead to high profits [1]. Since stock investment is a major financial market '
                              'activity, a lack of accurate knowledge and detailed information would lead to an inevitable '
                              'loss of investment. The prediction of the stock market is a difficult task as market movements '
                              'are always subject to uncertainties [2].', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.blue.shade200,
                        ],
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 25, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('What is Sentiment  Analysis?', style: TextStyle(color: Colors.black, fontSize: 40),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text('A stock market, equity market, or share market is the aggregation of buyers and '
                              'sellers of stocks (also called shares), which represent ownership claims on businesses; '
                              'these may include securities listed on a public stock exchange, as well as stock that is '
                              'only traded privately, such as shares of private companies which are sold to investors '
                              'through equity crowdfunding platforms. Investment in the stock market is most often done'
                              ' via stockbrokerages and electronic trading platforms. Investment is usually made with '
                              'an investment strategy in mind.', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Text('How we are predicting stock market using sentiment analysis.', style: TextStyle(color: Colors.black, fontSize: 40),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text('Stock market prediction aims to determine the future movement of the stock value '
                              'of a financial exchange. The accurate prediction of share price movement will lead to more'
                              ' profit investors can make. Predicting how the stock market will move is one of the most '
                              'challenging issues due to many factors that involved in the stock prediction, such as interest '
                              'rates, politics, and economic growth that make the stock market volatile and very hard to '
                              'predict accurately. The prediction of shares offers huge chances for profit and is a major'
                              ' motivation for research in this area; knowledge of stock movements by a fraction of a '
                              'second can lead to high profits [1]. Since stock investment is a major financial market '
                              'activity, a lack of accurate knowledge and detailed information would lead to an inevitable '
                              'loss of investment. The prediction of the stock market is a difficult task as market movements '
                              'are always subject to uncertainties [2].', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),

                      ],
                    ),
                  ),
                ),

              ],

            ),
          ),
        )
    );
  }
}



