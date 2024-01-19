class CartModel
{
  String name;
  double price;
  String size;
  String color;
  int quantity;
  String image;

  CartModel({
    required this.name,
    required this.price,
    required this.size,
    required this.color,
    required this.quantity,
    required this.image
  });



  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.name == name &&
        other.size == size &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^ size.hashCode ^ color.hashCode ^ image.hashCode;
  }

  factory CartModel.fromJson(jsonData)
  {
    return CartModel(
        name: jsonData['name'],
        price: jsonData['price'],
        size: jsonData['size'],
        color: jsonData['color'],
      quantity: jsonData['quantity'],
      image: jsonData['image']
    );
  }
}