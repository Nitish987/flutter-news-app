import 'package:flutter/material.dart';
import 'package:newsapp/pages/article_page.dart';
import 'package:newsapp/services/news.dart';

class Articles extends StatelessWidget {
  final String? category;

  const Articles({super.key, this.category});

  void toArticlePage(BuildContext context, dynamic feed) {
    if (feed.urlToImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No Article Available."),
      ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    feed: feed,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: News(category).feeds,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?['status']) {
            return ListView.builder(
              itemCount: snapshot.data?['content'].length,
              itemBuilder: (context, index) {
                if (snapshot.data?['content'][index].urlToImage != null) {
                  return GestureDetector(
                    onTap: () => toArticlePage(
                        context, snapshot.data?['content'][index]),
                    child: Card(
                        child: Column(
                      children: [
                        Image(
                            image: NetworkImage(
                                snapshot.data?['content'][index].urlToImage)),
                        ListTile(
                            title: Text(snapshot.data?['content'][index].title),
                            subtitle: Text(
                                snapshot.data?['content'][index].publishedAt)),
                      ],
                    )),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => toArticlePage(
                        context, snapshot.data?['content'][index]),
                    child: Card(
                        child: Column(
                      children: [
                        const Image(image: AssetImage('images/no_image.png')),
                        ListTile(
                            title: Text(snapshot.data?['content'][index].title),
                            subtitle: Text(
                                snapshot.data?['content'][index].publishedAt)),
                      ],
                    )),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
        } else {
          return const Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }
}
