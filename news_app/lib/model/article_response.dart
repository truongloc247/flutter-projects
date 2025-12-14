import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/model/article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: 'totalArticles')
  int totalArticles;

  @JsonKey(name: 'articles')
  List<Article> articles;

  ArticleResponse({required this.totalArticles, required this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}
