import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAdsItem extends StatelessWidget {
  String adsName;

   CustomAdsItem({
    super.key,
    required this.adsName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.purple,
          ),
          height: 120,
          width: 220,
        ),
         Text(adsName)
      ],
    );
  }
}
