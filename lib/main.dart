import 'package:flutter/material.dart';
import 'package:newsapp/services/news.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
          ),
          body: FutureBuilder<List>(
            future: News().feeds,
            builder: (context, snapshot) {

              if (snapshot.hasData) {

                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data?[index].title),
                        subtitle: Text(snapshot.data?[index].publishedAt),
                      ),
                    );
                  },
                );

              } else {

                return const Center(
                  child: Text('No Data found!'),
                );

              }
            },
          )),
    );
  }
}
