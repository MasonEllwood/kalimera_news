import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterNews/src/styles/kalimera_colors.dart';
import 'package:flutterNews/src/styles/kalimera_text_styles.dart';
import 'package:flutterNews/src/widgets/input/kalimera_search.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';

class KalimeraSplash extends StatefulWidget {
  @override
  _KalimeraSplashState createState() => new _KalimeraSplashState();
}

class _KalimeraSplashState extends State<KalimeraSplash> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {

    KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);
    
    return Expanded(
      child: Container(
        color: Colors.white,
            child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextLiquidFill(
                text: 'Kalimera',
                waveColor: KalimeraColors.lightblue,
                boxBackgroundColor: Colors.white,
                textStyle: KalimeraTextStyles.questrial60px,
                boxHeight: 150.0,
                loadDuration: Duration(milliseconds: 2000),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: KalimeraSearchBar(
                  key: key,
                  initialText: searchText,
                  onChanged: (value) {
                    searchText = value;
                    _newsList.text = searchText;
                  },
                  hint: 'Go on and search',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}