import 'dart:convert';

import 'package:global_tp/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsData {
  // https://newsapi.org/v2/top-headlines?country=ma&sortBy=publishAt&apiKey=fd8e9a2d5b2940cdbb5cc2f982c1f40d
  //String API_KEY = ;
  String BASE_API_URL = "https://newsapi.org/v2/top-headlines";
  String TAIL_API_URL =
      "sortBy=publishAt&apiKey=" + "fd8e9a2d5b2940cdbb5cc2f982c1f40d";

  List<ArticleModel> articlesList = <ArticleModel>[];

  String addQuerySearchToURL(String url, String? query) {
    if (query != null && !url.contains("q=") && !url.endsWith("&")) {
      return url + "?q=" + query + "&";
    }
    return url;
  }

  String addCategoryToURL(String url, String? query) {
    if (query != null && !url.contains("category=") && !url.endsWith("&")) {
      return url + "?category=" + query + "&";
    }
    return url;
  }

  String addCountryToURL(String url, String? query) {
    if (query != null && !url.contains("country=") && !url.endsWith("&")) {
      return url + "?country=" + query + "&";
    }
    return url;
  }

  Future<void> getNewsData(
      {String? q, String? category, String? country}) async {
    String url = addCategoryToURL(
            addCountryToURL(addQuerySearchToURL(BASE_API_URL, q), country),
            category) +
        TAIL_API_URL;
    print("URL API: " + url);
    var responce = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(responce.body);
    if (jsonData["status"] == "ok") {
      (jsonData["articles"] as List).forEach((jsonArticle) {
        ArticleModel articleModel = ArticleModel.fromJson(jsonArticle);
        articlesList.add(articleModel);
      });
    }
  }
}
