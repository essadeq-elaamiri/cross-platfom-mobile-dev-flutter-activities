import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_tp/pages/single_article_view.dart';

class ArticleTile extends StatelessWidget {
  final String? articleImageUrl, articleTitle, articleDescription, articleUrl;
  final String defaultArticleImage =
      "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80";
  ArticleTile(
      {@required this.articleImageUrl,
      @required this.articleTitle,
      @required this.articleDescription,
      @required this.articleUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => SingleArticleView(
              articleUrl,
            )
        ));
      },
      child: Container(
        // to be able add padding ...
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6))),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    articleImageUrl ?? defaultArticleImage,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: Text(
                    articleTitle ?? "Title",
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(
                    articleDescription ?? "Description",
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
