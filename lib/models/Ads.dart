
class AdsModel
{
  final String adsName;
  final String adsImage;
  AdsModel({required this.adsName, required this.adsImage});

  factory AdsModel.fromJson(jsonData)
  {
    return AdsModel(adsName: jsonData['name'], adsImage: jsonData['image'],
    );
  }
}