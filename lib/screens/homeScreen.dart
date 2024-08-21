import 'package:flutter/material.dart';
import 'package:newsapi/services/service.dart';
import '../model/newsModel.dart';
import 'newsDetail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<NewsModel> articles=[];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async{
    NewsApi newsapi = NewsApi();
    await newsapi.getNews();
    articles=newsapi.datastore;
    setState(() {
      articles=newsapi.datastore;
    });
    // print('news: $articles');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter News App', style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index){
            final article = articles[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetail(newsModel:article)));
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        article.urlToImage!,
                        height: 250, width: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      article.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(thickness: 2,),
                  ],
                ),
              ),
            );
            }
            ),
          ),
        ],
      )
    );
  }
}
