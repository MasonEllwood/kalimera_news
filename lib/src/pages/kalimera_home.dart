import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';
import 'package:flutterNews/src/widgets/general/kalimera_header.dart';

class KalimeraHome extends StatefulWidget {
  @override
  _KalimeraHomeState createState() => _KalimeraHomeState();
}

class _KalimeraHomeState extends State<KalimeraHome> {
  
  KalimeraNewsList _newsList;

  @override
  Widget build(BuildContext context) {

    _newsList = Provider.of<KalimeraNewsList>(context);
    List<dynamic> _getSliderNewsArticles = _newsList.getSliderNewsArticles();
    List<dynamic> _getRemainderNewsArticles = _newsList.getRemainderNewsArticles();

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
                                  return GestureDetector(
                                    onTap: (){
                                      _newsList.selected = _getSliderNewsArticles.indexOf(i);
                                      Navigator.pushNamed(context, '/inner');
                                    },
                                    child: Container(
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
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  titleChecker(i.title.trim()),
                                                  style: KalimeraTextStyles.questrialLightForest18px,
                                                ),
                                                SizedBox(height: 25),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      authorChecker(i.author.trim()),
                                                      style: KalimeraTextStyles.signikaLightForest13px,
                                                    ),
                                                    Text(
                                                      sourceChecker(i.source.trim()),
                                                      style: KalimeraTextStyles.signikaLightForest13px,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
                                  return GestureDetector(
                                    onTap: (){
                                      _newsList.selected = index + 5;
                                      Navigator.pushNamed(context, '/inner');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
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
                                          width: MediaQuery.of(context).size.width * 0.60,
                                          height: MediaQuery.of(context).size.width * 0.25,
                                          margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                titleChecker(_getRemainderNewsArticles[index].title),
                                                style: KalimeraTextStyles.questrialLightForest18px,
                                              ),
                                              SizedBox(height: 25),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    authorChecker(_getRemainderNewsArticles[index].author),
                                                    style: KalimeraTextStyles.signikaLightForest13px,
                                                  ),
                                                  Text(
                                                    sourceChecker(_getRemainderNewsArticles[index].source),                                                  
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

  String titleChecker(title) {
    if (title != null) {
      if (title.length > 60) {
        return '${(title).substring(0, 60)}...';
      } else {
        return title;
      }
    } else {
      return 'No Title';
    }   
  }

  String authorChecker(author) {
    if (author != null) {
      if (author.length > 20) {
        return '${(author).substring(0, 20)}...';
      } else {
        return author;
      }
    } else {
      return 'No Author';
    }   
  }

  String sourceChecker(source) {
    if (source != null) {
      if (source.length > 20) {
        return '${(source).substring(0, 20)}...';
      } else {
        return source;
      }
    } else {
      return 'No Source';
    }   
  }

}