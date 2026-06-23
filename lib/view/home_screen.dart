import 'package:flutter/material.dart';
import 'package:news_app_using_api/providers/news_provider.dart';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MynewsHomepage extends StatefulWidget {
  const MynewsHomepage({super.key});

  @override
  State<MynewsHomepage> createState() => _MynewsHomepageState();
}

class _MynewsHomepageState extends State<MynewsHomepage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NewsProvider>().fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailyArticles"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          SizedBox(width: 8),
        ],
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            itemCount: provider.newslist.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),

            itemBuilder: (context, index) {
              final article = provider.newslist[index];

              return NewsArticleCard(
                title: article.title,
                description: article.description,
                source: article.name,
                publishedAt: article.publishedAt,
              );
            },
          );
        },
      ),
      //  GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 5,
      //     mainAxisExtent: 5,
      //   ),
      //   itemBuilder: (context, index) {
      //     return NewsArticleCard(
      //       title: api.,
      //       description: description,
      //       source: source,
      //       publishedAt: publishedAt,
      //     );
      //   },
      // ),
    );
  }
}
