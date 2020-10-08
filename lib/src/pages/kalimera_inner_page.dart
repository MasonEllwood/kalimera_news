import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/widgets/general/kalimera_inner_header.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';


class KalimeraInnerPage extends StatefulWidget {
  @override
  _KalimeraInnerPageState createState() => _KalimeraInnerPageState();
}

class _KalimeraInnerPageState extends State<KalimeraInnerPage> {

    KalimeraNewsList _newsList;

  @override
  Widget build(BuildContext context) {

    _newsList = Provider.of<KalimeraNewsList>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Column(
              children: <Widget> [
                KalimeraInnerHeader(),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ListView(
                        padding: EdgeInsets.only(top: 25),
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            height: 250.0,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("${_newsList.getNewsArticle(_newsList.selected).urlToImage}"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                          Align(
                            heightFactor: .6,
                            child: Container(
                              // height: 150.0,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20, 60, 20, 30),
                              margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    titleChecker(_newsList.getNewsArticle(_newsList.selected).title),
                                    style: KalimeraTextStyles.questrialLightForest18px,
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        authorChecker(_newsList.getNewsArticle(_newsList.selected).author),
                                        style: KalimeraTextStyles.signikaLightForest13px,
                                      ),
                                      Text(
                                        sourceChecker(_newsList.getNewsArticle(_newsList.selected).source),                                                  
                                        style: KalimeraTextStyles.signikaLightForest13px,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    sourceContent(_newsList.getNewsArticle(_newsList.selected).content),
                                    style: KalimeraTextStyles.questrialLightForest24px,
                                  ),
                                  SizedBox(height: 25),
                                ],
                              ),
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
        return '${(title).substring(0, 60)}';
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
        return '${(source).substring(0, 20)}';
      } else {
        return source;
      }
    } else {
      return 'No Source';
    }   
  }

  String sourceContent(content) {
    if (content != null) {
      if (content.length > 200) {
        return '${(content).substring(0, 200)}';
      } else {
        return content;
      }
    } else {
      return 'No content';
    }   
  }
  
}