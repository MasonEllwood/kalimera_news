import 'package:flutter/cupertino.dart';
import 'package:flutterNews/src/models/kalimera_news.dart';
import 'package:dio/dio.dart';

class KalimeraNewsList with ChangeNotifier {

  // creates recipes list on main load.
  KalimeraNewsList(){
    getNews();
  }

  // init dio
  final Dio _dio = Dio();

  List<KalimeraNews> _newsList = List();

  Future getNews() async {
    try {
      // response
      Response response = await _dio.get('http://newsapi.org/v2/everything?q=random&from=2020-09-04&sortBy=popularity&language=en&apiKey=8e59d6419c654154961ff30fb7bd6a40');
      for (int i = 0; i < response.data['articles'].length; i++) {
        _newsList.add(KalimeraNews.fromJson(response.data['articles'][i])); 
      }
      print(_newsList[1]);
      return(_newsList);
    } catch(e){
      print(e.toString());
    }
  }

  // all news articles
  List getAllNewsArticles(){
    return _newsList;
  }

  // slider list
  List getSliderNewsArticles(){
    List _firstFiveList = [];
    for(var i=0; i <= 4; i++) {
      _firstFiveList.add(_newsList[i]);
    }
    return _firstFiveList;
  }
  
  // gets remainder of list
  List getRemainderNewsArticles(){
    List _firstFiveList = [];
    for(var i=5; i < _newsList.length; i++) {
      _firstFiveList.add(_newsList[i]);
    }
    return _firstFiveList;
  }
  
  KalimeraNews getNewsArticle(int index){
    return _newsList[index];
  }

  int _selected = -1;

  int get selected {
    return this._selected;
  }

  set selected(int selected) {
    this._selected = selected;
    print(_selected);
    notifyListeners();
  }

  int length(){
    return _newsList.length;
  }

}