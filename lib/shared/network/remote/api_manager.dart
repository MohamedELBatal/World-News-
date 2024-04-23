import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsDataModel.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/shared/componets/constants.dart';
import 'package:news_app/shared/network/remote/endPoints.dart';
import 'package:news_app/shared/styles/app_strings.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String categoryID) async {
    Uri url = Uri.http(
        Constants.BASE_URL, EndPoints.sources, {"category": categoryID});
    http.Response response = await http
        .get(url, headers: {AppString.apikey: Constants.API_KEY_VALUE});

    var json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url =
        Uri.http(Constants.BASE_URL, EndPoints.NewsData, {"sources": sourceId});
    http.Response response = await http.get(url, headers: {
      AppString.apikey: Constants.API_KEY_VALUE,
    });

    var json = jsonDecode(response.body);

    return NewsDataModel.fromJson(json);
  }

  static Future<NewsDataModel> SearchArticles(String query) async {
    Uri url = Uri.http(Constants.BASE_URL, EndPoints.NewsData, {});
    http.Response response = await http.get(url, headers: {
      "q": query,
      AppString.apikey: Constants.API_KEY_VALUE,
    });

    var json = jsonDecode(response.body);

    return NewsDataModel.fromJson(json);
  }
}
