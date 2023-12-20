
class AdsModel
{
  final String adsName;
  AdsModel({required this.adsName});

  factory AdsModel.fromJson(jsonData)
  {
    return AdsModel(adsName: jsonData['name']);
  }
}