import 'package:flutter/material.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';

class KalimeraStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);
    List<dynamic> _getAllNewsArticles = _newsList.getAllNewsArticles();
  
    List _firstFiveList = [];
    for(var i=5; i < _getAllNewsArticles.length; i++) {
      _firstFiveList.add(_getAllNewsArticles[i]);
    }
    
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _firstFiveList.length,
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
                      image: NetworkImage("${_firstFiveList[index].urlToImage}"),
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
                        titleChecker(_firstFiveList[index].title),
                        style: KalimeraTextStyles.questrialLightForest18px,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            authorChecker(_firstFiveList[index].author),
                            style: KalimeraTextStyles.signikaLightForest13px,
                          ),
                          Text(
                            sourceChecker(_firstFiveList[index].source),                                                  
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