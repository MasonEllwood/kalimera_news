import 'package:flutter/material.dart';
import 'package:flutterNews/src/widgets/general/kalimera_header.dart';
import 'package:flutterNews/src/widgets/news_feed/kalimera_body.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:flutterNews/src/widgets/news_feed/kalimera_splash.dart';

class KalimeraHome extends StatefulWidget {
  @override
  _KalimeraHomeState createState() => _KalimeraHomeState();
}

class _KalimeraHomeState extends State<KalimeraHome> {
  @override
  Widget build(BuildContext context) {

    KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Column(
              children: <Widget> [
                KalimeraHeader(),
                _newsList.getAllNewsArticles().length != 0 ? KalimeraBody() : KalimeraSplash(),
              ]
            );
          }
        )
      ),
    );
  }
}