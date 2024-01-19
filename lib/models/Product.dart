
import 'package:shopify_app/models/Review.dart';

class Product
{
  String name;
  String image;
  double price;
  double rate;
  List<String> size;
  String material;
  String fitting;
  String condition;
  List<String> color;
  String brand;
  String sku;
  List<Review> reviews;
  String CategoryID;


  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.size,
    required this.material,
    required this.fitting,
    required this.condition,
    required this.color,
    required this.brand,
    required this.sku,
    required this.reviews,
    required this.CategoryID
  });

  factory Product.fromJson(jsonData) {
    return Product(
      name: jsonData['name'],
      image: jsonData['image'],
      price: jsonData['price'],
      rate: jsonData['rate'],
      size: (jsonData['size'] as List<dynamic>).cast<String>(), // Adjust the parsing here
      material: jsonData['material'],
      fitting: jsonData['fitting'],
      condition: jsonData['condition'],
      color: (jsonData['colors'] as List<dynamic>? ?? []).cast<String>(), // Adjust the parsing here
      brand: jsonData['brand'],
      sku: jsonData['SKU'],
      reviews: (jsonData['Reviews'] as List<dynamic>)
          .map((reviewData) => Review.fromJson(reviewData))
          .toList(),

        CategoryID: jsonData['CategoryID']
    );


  }
}