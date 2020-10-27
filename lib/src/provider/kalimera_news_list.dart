import 'package:flutter/cupertino.dart';
import 'package:flutterNews/src/models/kalimera_news.dart';
import 'package:dio/dio.dart';

class KalimeraNewsList with ChangeNotifier {

  String _searchTerm = '';
  
  String get searchTerm {
    return this._searchTerm;
  }

  set text(String text) {
    this._searchTerm = text;
    notifyListeners();
  }

  // init dio
  final Dio _dio = Dio();

  List<KalimeraNews> _newsList = List();

  Future getNews() async {
    String sanitizedSearchTerm = searchTerm.trim().replaceAll(RegExp(' +'), '-').toLowerCase();
    _newsList.clear();
    // print(sanitizedSearchTerm);
    try {
      // response
      Response response = await _dio.get('http://newsapi.org/v2/everything?q=$sanitizedSearchTerm&from=2020-27-10&sortBy=popularity&language=en&apiKey=8e59d6419c654154961ff30fb7bd6a40');
      for (int i = 0; i < response.data['articles'].length; i++) {
        _newsList.add(KalimeraNews.fromJson(response.data['articles'][i])); 
      }
      print(_newsList.length);
      notifyListeners();
      return(_newsList);
    } catch(e){
      print(e.toString());
    }
  }

  // all news articles
  List getAllNewsArticles(){
    return _newsList;
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