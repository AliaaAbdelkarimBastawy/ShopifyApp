class CartModel
{
  String name;
  String price;
  String size;
  String color;
  String quantity;

  CartModel({
    required this.name,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity
  });

  factory CartModel.fromJson(jsonData)
  {
    return CartModel(
        name: jsonData['name'],
        price: jsonData['price'],
        size: jsonData['size'],
        color: jsonData['color'],
      quantity: jsonData['quantity']
    );
  }
}