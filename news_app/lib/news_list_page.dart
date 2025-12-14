import 'package:flutter/material.dart';
import 'package:news_app/api.dart';
import 'package:news_app/article_detail.dart';
import 'package:news_app/model/article.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late API api;
  late Future<List<Article>?> articles;

  @override
  void initState() {
    super.initState();
    api = API();
    articles = api.getAllArticles('code', 2, 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          appBar(),
          Expanded(child: listBody()),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      color: Color(0xFF35A2B6),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                articles = api.getAllArticles('code', 3, 5);
              });
            },
            icon: Icon(Icons.home_filled, color: Colors.white),
          ),
          Text(
            'MY NEWS APP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget listBody() {
    return FutureBuilder(
      future: articles,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          if (snap.data == null) {
            return Center(child: Text('Getting data failed'));
          }
          return renderArticleList(snap.data!);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget renderArticle(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetail(article: article),
          ),
        );
      },
      child: Row(
        spacing: 5,
        children: [
          SizedBox(
            width: 150,
            height: 100,
            child: Image.network(article.image, fit: BoxFit.cover),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  article.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderArticleList(List<Article> articles) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) =>
            renderArticle(context, articles[index]),
      ),
    );
  }
}
