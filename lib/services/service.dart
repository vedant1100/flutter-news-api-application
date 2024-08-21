import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/newsModel.dart';

class NewsApi{
  List<NewsModel> datastore=[];
  Future<void> getNews() async {
    Uri url=Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=04b4bd6ebf1d4afb90d1669a6fb06a2d");
    var response= await http.get(url);
    var JsonData=jsonDecode(response.body);
    if(JsonData['status']=='ok'){
      JsonData['articles'].forEach((element) {
        if(element['url']!=null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            urlToImage:element['urlToImage'],
          );
          datastore.add(newsModel);
        }
      });
    }
  }
}