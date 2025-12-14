import 'package:dio/dio.dart';
import 'package:product_list/model/product.dart';

class API {
  Future<List<Product>?> getAllProduct() async {
    var dio = Dio();
    var response = await dio.request(
      'https://fakestoreapi.com/products',
      options: Options(method: 'GET'),
    );

    if (response.statusCode == 200) {
      List products = response.data;
      return products.map((json) => Product.fromJson(json)).toList();
    }
    return null;
  }
}
