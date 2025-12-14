import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key, required this.article});

  final Article article;

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  Widget appBar() {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF35A2B6)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [appBar(), detailBody()]),
    );
  }

  Widget detailBody() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Text(
              widget.article.title,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.article.publishedTime}",
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            Text(widget.article.description),
            SizedBox(
              height: 200,
              child: Image.network(widget.article.image, fit: BoxFit.cover),
            ),
            Text(widget.article.content),
            Text(
              widget.article.url,
              style: TextStyle(color: Color(0xFF35A2B6)),
            ),
          ],
        ),
      ),
    );
  }
}
