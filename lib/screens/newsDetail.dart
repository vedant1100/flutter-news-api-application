import 'package:flutter/material.dart';
import '../model/newsModel.dart';

class NewsDetail extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetail({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: ListView(
        children: [
          Text(
            newsModel.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              
              Expanded(
                child: Text("- ${newsModel.author!}", maxLines: 1,),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Image.network(newsModel.urlToImage!,),
          const SizedBox(height: 10,),
          Text(
            newsModel.content!,
            style: const TextStyle(fontSize: 18,),
          ),
          const SizedBox(height: 10,),
          Text(
            newsModel.description!,
            style: const TextStyle(fontSize: 18,),
          ),
        ],
      ),
    );
  }
}
