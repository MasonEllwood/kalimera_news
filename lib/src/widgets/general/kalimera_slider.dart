import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';

class KalimeraSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);
  List<dynamic> _getAllNewsArticles = _newsList.getAllNewsArticles();

    // slider list
    List<dynamic> _firstFiveList = [];
    for(var i=0; i <= 4; i++) {
      _firstFiveList.add(_getAllNewsArticles[i]);
      print(_firstFiveList[i].author);
    }

    return CarouselSlider(
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
      items: _firstFiveList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: (){
                _newsList.selected = _firstFiveList.indexOf(i);
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
        return '${(author).substring(0, 20)}';
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