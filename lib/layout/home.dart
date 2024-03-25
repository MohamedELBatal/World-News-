import 'package:flutter/material.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const Drawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            title: const Text(
              "News",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.green,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
            ),
          ),
          body: FutureBuilder(
            future: ApiManager.getSources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text("SomeThing Went Wrong");
              }
              var sourcesList = snapshot.data?.sources ?? [];
              return NewsTab(sources: sourcesList);
            },
          )),
    );
  }
}
