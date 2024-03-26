import 'package:flutter/material.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryID;
   DataTab({required this.categoryID,super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: ApiManager.getSources(categoryID),
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
    );
  }
}
