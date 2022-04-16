import 'package:flutter/material.dart';
import 'package:global_tp/data/categories_data.dart';
import 'package:global_tp/models/category_model.dart';

class CategoryCardItem extends StatelessWidget {
  final String? cetgoryImageAssetUrl, categoryName;
  final String defaultImageURL =
      "https://images.unsplash.com/photo-1618598827591-696673ab0abe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";
  CategoryCardItem(this.categoryName, this.cetgoryImageAssetUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //********** */
      onTap: () {
        print(this.categoryName);
        /*
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));*/
      },
      child: Container(
        margin: EdgeInsets.only(right: 4, left: 4),
        child: Stack(
          alignment: Alignment.center, //*********** */
          children: [
            // == RelativeLayout in Native Android java
            ClipRRect(
                //********** */
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  cetgoryImageAssetUrl??defaultImageURL,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName ?? "Category",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
