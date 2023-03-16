import 'package:flutter/material.dart';
import 'package:newsapp/widgets/article_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> categoryTabs = const [
    Tab(text: 'General'),
    Tab(text: 'Entertainment'),
    Tab(text: 'Business'),
    Tab(text: 'Health'),
    Tab(text: 'Science'),
    Tab(text: 'Sports'),
    Tab(text: 'Technology')
  ];

  @override
  void initState() {
    _tabController = TabController(length: categoryTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
        bottom: TabBar(controller: _tabController, tabs: categoryTabs, isScrollable: true,),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Articles(category: 'general'),
          Articles(category: 'entertainment'),
          Articles(category: 'business'),
          Articles(category: 'health'),
          Articles(category: 'science'),
          Articles(category: 'sports'),
          Articles(category: 'technology'),
        ],
      ),
    );
  }
}
