class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ArticleModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = DateTime.parse(json['publishedAt']);
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}


 



  // https://newsapi.org/v2/top-headlines?country=ma&sortBy=publishAt&apiKey=fd8e9a2d5b2940cdbb5cc2f982c1f40d
  /*
  {
  "source": {
    "id": null,
    "name": "Leconomiste.com"
  },
  "author": null,
  "title": "Tanger: Ironman arrive en octobre - L'Économiste",
  "description": "Tanger accueillera le 30 octobre prochain le circuit Ironman 70.3, un des triathlons les plus réputées. A Tanger, leur circuit prévoit une étape natation avec 1,9 kilomètres de nage ...",
  "url": "https://www.leconomiste.com/flash-infos/tanger-ironman-arrive-en-octobre",
  "urlToImage": "https://www.leconomiste.com/sites/default/files/eco7/public/ironman_-_marrakech_tt_tt.jpg",
  "publishedAt": "2022-04-10T09:30:00Z",
  "content": "Tanger accueillera le 30 octobre prochain le circuit Ironman 70.3, un des triathlons les plus réputées. A Tanger, leur circuit prévoit une étape natation avec 1,9 kilomètres de nage, suivie par 90 km… [+285 chars]"
}
  */
