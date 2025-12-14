import 'package:dio/dio.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/article_response.dart';

class API {
  Future<List<Article>?> getAllArticles(
    String searchKey,
    int pageNumber,
    int pageSize,
  ) async {
    Dio dio = Dio();
    var response = await dio.request(
      'https://gnews.io/api/v4/search?q=${searchKey}&lang=en&max=${pageSize}&page=${pageNumber}&apikey=151b6e72bd410219576f51ae1749df9e',
      options: Options(method: 'GET'),
    );
    if (response.statusCode == 200) {
      ArticleResponse articleResponse = ArticleResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      return articleResponse.articles;
    }
    return null;
  }
}
