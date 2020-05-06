class News {
  String title;
  String url;
  String message;
  String writter;
  String country;

  News({this.title, this.url, this.message});
  News.fromJson(parsedJson) {
    title = parsedJson["title"];
    url = parsedJson["url"];
    message = parsedJson["message"];
    writter = parsedJson["writter"];
    country = parsedJson["country"];
  }
}
