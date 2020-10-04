
class KalimeraNews {
  int id;
  String source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  KalimeraNews({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  KalimeraNews.fromJson(Map<String, dynamic> json)  
    : source = json['source']['name'],
      author = json['author'],
      title = json['title'],
      description = json['description'],
      url = json['url'],
      urlToImage = json['urlToImage'],
      publishedAt = json['publishedAt'],
      content = json['content'];
}