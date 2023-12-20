import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAdsItem extends StatelessWidget {
  const CustomAdsItem({
    super.key,
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
        const Text("Ad")
      ],
    );
  }
}
