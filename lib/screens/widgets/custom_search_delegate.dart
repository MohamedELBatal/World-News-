import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/news_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class CustomSearch extends SearchDelegate {
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder(
        future: ApiManager.SearchArticles(query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("SomeThing Went Wrong");
          }
          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 50,
              ),
              itemBuilder: (context, index) {
                return NewsItem(article: articles[index]);
              },
              itemCount: articles.length,
            ),
          );
        },
      );
    }
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder(
        future: ApiManager.SearchArticles(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text("SomeThing Went Wrong");
          }

          var articles = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                return NewsItem(article: articles[index]);
              },
              itemCount: articles.length,
            ),
          );
        },
      );
    }
    return Container();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.close),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: const Color(0xFF39A552),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF39A552),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
          iconSize: MaterialStatePropertyAll(30),
          iconColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
      ),
      hintColor: Colors.white,
    );
  }
}
