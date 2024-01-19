class Review
{
  String name;
  String comment;
  String date;


  Review({
    required this.name,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(jsonData)
  {
    return Review(
        name: jsonData['name'],
        comment: jsonData['comment'],
        date: jsonData['date'],);
  }
}