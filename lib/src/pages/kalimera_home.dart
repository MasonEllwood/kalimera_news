import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/general/kalimera_header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';

class KalimeraHome extends StatefulWidget {
  @override
  _KalimeraHomeState createState() => _KalimeraHomeState();
}

class _KalimeraHomeState extends State<KalimeraHome> {
  @override
  Widget build(BuildContext context) {

    // List<dynamic> _getAllNewsArticles = Provider.of<KalimeraNewsList>(context).getAllNewsArticles();
    List<dynamic> _getSliderNewsArticles = Provider.of<KalimeraNewsList>(context).getSliderNewsArticles();
    List<dynamic> _getRemainderNewsArticles = Provider.of<KalimeraNewsList>(context).getRemainderNewsArticles();
    print(_getRemainderNewsArticles);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Column(
              children: <Widget> [
                KalimeraHeader(),                
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView(
                        padding: EdgeInsets.only(top: 25, bottom: 25),
                        shrinkWrap: true,
                        children: <Widget>[
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 400.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 8),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                            ),
                            items: _getSliderNewsArticles.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    // margin: EdgeInsets.all(20),
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage("${i.urlToImage}"),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: new BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      boxShadow: kElevationToShadow[2],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(20.0),
                                            ),
                                            boxShadow: kElevationToShadow[2],
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${i.title}', 
                                                style: KalimeraTextStyles.questrialLightForest18px,
                                              ),
                                              SizedBox(height: 25),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Author: ${i.author}', 
                                                    style: KalimeraTextStyles.signikaLightForest13px,
                                                  ),
                                                  Text(
                                                    '${i.source}', 
                                                    style: KalimeraTextStyles.signikaLightForest13px,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _getRemainderNewsArticles.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.all(20),
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        height: MediaQuery.of(context).size.width * 0.30,
                                        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("${_getRemainderNewsArticles[index].urlToImage}"),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: new BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                          ),
                                          boxShadow: kElevationToShadow[2],
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.all(20),
                                        width: MediaQuery.of(context).size.width * 0.60,
                                        height: MediaQuery.of(context).size.width * 0.25,
                                        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30),
                                        decoration: BoxDecoration(
                                          // color: Colors.white,
                                          // boxShadow: kElevationToShadow[2],
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              '${_getRemainderNewsArticles[index].title}', 
                                              style: KalimeraTextStyles.questrialLightForest18px,
                                            ),
                                            SizedBox(height: 25),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Author: ${_getRemainderNewsArticles[index].author}', 
                                                  style: KalimeraTextStyles.signikaLightForest13px,
                                                ),
                                                Text(
                                                  '${_getRemainderNewsArticles[index].source}', 
                                                  style: KalimeraTextStyles.signikaLightForest13px,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                              }
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ]
            );
          }
        )
      ),
    );
  }
}