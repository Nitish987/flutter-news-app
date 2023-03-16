import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/services/api.dart';
import 'package:newsapp/services/Models.dart';

class News {
  final String? category;

  News(this.category);

  Future<http.Response> fetchFeeds() {
    return http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=${NewsAPI.country}&category=${category}&pageSize=${NewsAPI.pageSize}&apiKey=${NewsAPI.key}'));
  }

  Future<Map<String, dynamic>> get feeds async {
    List<Feed> feeds = [];
    try {
      http.Response response = await fetchFeeds();
      final Map<String, dynamic> data = await jsonDecode(response.body);

      if (data['status'] == 'ok') {
        List articles = data['articles'];
        articles.forEach((element) {
          feeds.add(Feed(
              Source(element['id'], element['name']),
              element['author'],
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['publishedAt'],
              element['content']));
        });
      } else {
        return {"status": false, "content": feeds};
      }
    } on Exception {
      return {"status": false, "content": feeds};
    }

    return {"status": true, "content": feeds};
  }
}
