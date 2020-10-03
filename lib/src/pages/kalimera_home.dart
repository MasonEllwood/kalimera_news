import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/general/kalimera_header.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:provider/provider.dart';

class KalimeraHome extends StatefulWidget {
  @override
  _KalimeraHomeState createState() => _KalimeraHomeState();
}

class _KalimeraHomeState extends State<KalimeraHome> {
  @override
  Widget build(BuildContext context) {
    
    List<dynamic> _newsList = Provider.of<KalimeraNewsList>(context).getAllNewsArticles();
    
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
                              enableInfiniteScroll: false,
                            ),
                            items: _newsList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 15.0),
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
                                      )
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
                                            )
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${i.title}', 
                                                style: TextStyle(
                                                  fontSize: 16.0
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    '${i.author}', 
                                                    style: TextStyle(
                                                      fontSize: 16.0
                                                    ),
                                                  ),
                                                  Text(
                                                    '${i.source}', 
                                                    style: TextStyle(
                                                      fontSize: 16.0
                                                    ),
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