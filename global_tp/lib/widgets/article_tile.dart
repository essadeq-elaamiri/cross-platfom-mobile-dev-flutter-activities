import 'package:flutter/cupertino.dart';

class ArticleTile extends StatelessWidget {
  final String? articleImageUrl, articleTitle, articleDescription;
  final String defaultArticleImage =
      "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  ArticleTile(
      {@required this.articleImageUrl,
      @required this.articleTitle,
      @required this.articleDescription});
  @override
  Widget build(BuildContext context) {
    return Container(
      // to be able add padding ...
      child: Column(children: [
        ClipRRect(
          child: Image.network(articleImageUrl ?? defaultArticleImage),
        ),
        Container(
          child: Text(
            articleTitle ?? "Title",
          ),
        ),
        Container(
          child: Text(
            articleDescription ?? "Description",
          ),
        )
      ]),
    );
  }
}
