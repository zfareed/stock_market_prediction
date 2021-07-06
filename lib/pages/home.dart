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
                              'second can lead to high profits. Since stock investment is a major financial market '
                              'activity, a lack of accurate knowledge and detailed information would lead to an inevitable '
                              'loss of investment. The prediction of the stock market is a difficult task as market movements '
                              'are always subject to uncertainties.', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1000,
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
                          child: Text('Sentiment analysis is a type of data mining that measures the inclination of people’s opinions '
                              'through natural language processing (NLP), computational linguistics and text analysis, which are used '
                              'to extract and analyze subjective information from the Web - mostly social media and similar sources. '
                              'The analyzed data quantifies the general public sentiments or reactions toward certain products, people '
                              'or ideas and reveal the contextual polarity of the information.', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.blueAccent),

                          ),
                            child: Image.asset('images/sentiments.png', width: 600, height: 250,)),
                        SizedBox(
                          height: 70,
                        ),
                        Text('How we are predicting stock market using sentiment analysis.', style: TextStyle(color: Colors.black, fontSize: 40),),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text('The prediction and speculation about the values of the stock market especially the values of the worldwide companies are a really interesting and attractive topic. In this article, we cover the topic of the stock value changes and predictions of the stock values using fresh scraped economic news about the companies. We are focussing on the headlines of economic news. We use numerous different tools to the sentiment analysis of the headlines. We consider BERT as the baseline and compare the results with three other tools, VADER, TextBlob, and a Recurrent Neural Network, and compare the sentiment results to the stock changes of the same period. The BERT and RNN were much more accurate, these tools were able to determine the emotional values without neutral sections, in contrast to the other two tools. Comparing these results with the movement of stock market values in the same time periods, we can establish the moment of the change occurred in the stock values with sentiment analysis of economic news headlines. Also we discovered a significant difference between the different models in terms of the effect of emotional values on the change in the value of the stock market by the correlation matrices.', style: TextStyle(color: Colors.black, fontSize: 20.0), textAlign: TextAlign.justify,),
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



