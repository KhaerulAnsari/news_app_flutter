import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/model/article.dart';
import 'package:news_app_flutter/ui/article_web_view.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const DetailPage({@required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: article.urlToImage,
              child: Image.network(article.urlToImage),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(article.description),
                  Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text('Date: ${article.publishedAt}'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Author : ${article.author}'),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    article.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    // color: Colors.lightBlue[200],
                    child: Text(
                      "Read More",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebView.routeName,
                          arguments: article.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
