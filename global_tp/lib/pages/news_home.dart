import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_tp/data/categories_data.dart';
import 'package:global_tp/data/news_data.dart';
import 'package:global_tp/models/article_model.dart';
import 'package:global_tp/models/category_model.dart';
import 'package:global_tp/widgets/article_tile.dart';
import 'package:global_tp/widgets/category_card_item_widget.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<CategoryModel> categoriesList = <CategoryModel>[];
  List<ArticleModel> articlesList = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    // TODO: search about it
    super.initState();
    //init list
    categoriesList = getCategoriesList();
    getNewsData();
  }

  void getNewsData() async {
    NewsData newsData = NewsData();

    await newsData.getNewsData(q: null, country: "us", category: null);
    articlesList = newsData.articlesList;
    print(articlesList.isEmpty);

    setState(() {
      // when all data arrived, update _loading
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Colors.amberAccent,
                  ),
                ),
              )
            : SingleChildScrollView(
            //scrollDirection: Axis.vertical,
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          ////categories
                          height: 66, //*********** */
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true, // ******* sol
                              itemCount: categoriesList.length,
                              itemBuilder: (context, index) {
                                return CategoryCardItem(
                                    categoriesList[index].categoryName,
                                    categoriesList[index].categoryImageUrl);
                              }),
                        ),
                        Container(
                          ////  articles
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: articlesList.length,
                              itemBuilder: (context, index) {
                                return ArticleTile(
                                    articleImageUrl:
                                        articlesList[index].urlToImage,
                                    articleTitle: articlesList[index].title,
                                    articleDescription:
                                        articlesList[index].description);
                              }),
                        )
                      ],
                    ))));
  }
}
