import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/general/kalimera_header.dart';
import 'package:carousel_slider/carousel_slider.dart';

class KalimeraHome extends StatefulWidget {
  @override
  _KalimeraHomeState createState() => _KalimeraHomeState();
}

class _KalimeraHomeState extends State<KalimeraHome> {
  @override
  Widget build(BuildContext context) {
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
                            items: [1,2,3,4,5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                                  );
                                },
                              );
                            }).toList(),
                          )
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