
class CategoryModel
{
  final String categoryName;
  final String categoryImage;
  CategoryModel({required this.categoryName, required this.categoryImage});

  factory CategoryModel.fromJson(jsonData)
  {
    return CategoryModel(
        categoryName: jsonData['name'],
        categoryImage: jsonData['image'],
    );
  }
}