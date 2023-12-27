
class ProductModel
{
  String name;
  String price;
  String rating;
  List<String> size;
  List<String> color;

  ProductModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.size,
    required this.color,
  });

  factory ProductModel.fromJson(jsonData)
  {
    return ProductModel(
        name: jsonData['name'],
        price: jsonData['price'],
        rating: jsonData['rating'],
        size: jsonData['size'],
        color: jsonData['color']);
  }
}