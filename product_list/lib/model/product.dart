import 'package:json_annotation/json_annotation.dart';
import 'package:product_list/model/rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'id')
  int productId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'rating')
  Rating rating;

  Product({
    required this.productId,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
