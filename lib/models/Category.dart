
class CategoryModel
{
  final String categoryName;
  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(jsonData)
  {
    return CategoryModel(categoryName: jsonData['name']);
  }
}