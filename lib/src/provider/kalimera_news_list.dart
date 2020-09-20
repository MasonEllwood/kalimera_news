import 'package:flutter/cupertino.dart';
import 'package:flutterNews/src/models/kalimera_news.dart';

class KalimeraNewsList with ChangeNotifier {
  
  List<KalimeraNews> _newsList = [
    KalimeraNews(
      source: "ESPN",
      author: "Harry Kettle",
      title: "Kepa, Christensen both 4/10 as mistakes haunt Chelsea vs. Liverpool",
      description: "Andreas Christensen was sent off, Kepa Arrizabalaga made another mistake and Jorginho missed a penalty in Chelsea's hapless 2-0 defeat to Liverpool",
      url: "https://www.espn.com/soccer/chelsea/story/4184204/kepachristensen-both-4-10-as-mistakes-haunt-chelsea-vs-liverpool",
      urlToImage: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0920%2Fr748486_1296x729_16%2D9.jpg",
      publishedAt: "2020-09-20T18:09:23Z",
      content: "Chelsea fell to their first loss of the new Premier League season as they were beaten 2-0 by Liverpool at Stamford Bridge on Sunday. Andreas Christensen's red card just before half-time completely a… [+4446 chars]",
    ),
    KalimeraNews(
      source: "ESPN",
      author: "Harry Kettle",
      title: "Kepa, Christensen both 4/10 as mistakes haunt Chelsea vs. Liverpool",
      description: "Andreas Christensen was sent off, Kepa Arrizabalaga made another mistake and Jorginho missed a penalty in Chelsea's hapless 2-0 defeat to Liverpool",
      url: "https://www.espn.com/soccer/chelsea/story/4184204/kepachristensen-both-4-10-as-mistakes-haunt-chelsea-vs-liverpool",
      urlToImage: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0920%2Fr748486_1296x729_16%2D9.jpg",
      publishedAt: "2020-09-20T18:09:23Z",
      content: "Chelsea fell to their first loss of the new Premier League season as they were beaten 2-0 by Liverpool at Stamford Bridge on Sunday. Andreas Christensen's red card just before half-time completely a… [+4446 chars]",
    ),
    KalimeraNews(
      source: "ESPN",
      author: "Harry Kettle",
      title: "Kepa, Christensen both 4/10 as mistakes haunt Chelsea vs. Liverpool",
      description: "Andreas Christensen was sent off, Kepa Arrizabalaga made another mistake and Jorginho missed a penalty in Chelsea's hapless 2-0 defeat to Liverpool",
      url: "https://www.espn.com/soccer/chelsea/story/4184204/kepachristensen-both-4-10-as-mistakes-haunt-chelsea-vs-liverpool",
      urlToImage: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0920%2Fr748486_1296x729_16%2D9.jpg",
      publishedAt: "2020-09-20T18:09:23Z",
      content: "Chelsea fell to their first loss of the new Premier League season as they were beaten 2-0 by Liverpool at Stamford Bridge on Sunday. Andreas Christensen's red card just before half-time completely a… [+4446 chars]",
    ),
    KalimeraNews(
      source: "ESPN",
      author: "Harry Kettle",
      title: "Kepa, Christensen both 4/10 as mistakes haunt Chelsea vs. Liverpool",
      description: "Andreas Christensen was sent off, Kepa Arrizabalaga made another mistake and Jorginho missed a penalty in Chelsea's hapless 2-0 defeat to Liverpool",
      url: "https://www.espn.com/soccer/chelsea/story/4184204/kepachristensen-both-4-10-as-mistakes-haunt-chelsea-vs-liverpool",
      urlToImage: "https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0920%2Fr748486_1296x729_16%2D9.jpg",
      publishedAt: "2020-09-20T18:09:23Z",
      content: "Chelsea fell to their first loss of the new Premier League season as they were beaten 2-0 by Liverpool at Stamford Bridge on Sunday. Andreas Christensen's red card just before half-time completely a… [+4446 chars]",
    ),
  ];
  
  KalimeraNews getNewsArticles(int index){
    return _newsList[index];
  }

}