import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterNews/src/provider/kalimera_news_list.dart';
import 'package:flutterNews/src/widgets/input/kalimera_search.dart';
import 'package:flutterNews/src/widgets/general/kalimera_slider.dart';
import 'package:flutterNews/src/widgets/general/kalimera_stream.dart';

class KalimeraBody extends StatefulWidget {
  @override
  _KalimeraBodyState createState() => _KalimeraBodyState();
}

class _KalimeraBodyState extends State<KalimeraBody> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {

    KalimeraNewsList _newsList = Provider.of<KalimeraNewsList>(context);
    
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                child: KalimeraSearchBar(
                  key: key,
                  initialText: _newsList.searchTerm,
                  onChanged: (value) {
                    searchText = value;
                    _newsList.text = searchText;
                  },
                  hint: 'Go on and search',
                ),
              ),
              KalimeraSlider(),
              KalimeraStream(),
            ],
          ),
        ),
      ),
    );
  }
}















