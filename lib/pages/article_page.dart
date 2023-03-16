import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final dynamic feed;

  const ArticlePage({super.key, this.feed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(feed!.title!),
      ),
      body: Column(children: [
        Image(image: NetworkImage(feed!.urlToImage)),
         Container(
          padding: const EdgeInsets.all(10),
          child: Text(feed!.publishedAt!, style: const TextStyle(fontSize: 10),),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            feed!.title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(feed!.description!),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(feed!.content!),
        ),
      ]),
    );
  }
}
