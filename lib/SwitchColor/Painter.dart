import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Painter extends StatelessWidget {
  final Color color;
  final dynamic image;

  const Painter({Key? key, required this.color, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (image is String && image.startsWith('http')) {
      imageWidget = ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [color, color],
            stops: const [0.0, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.softLight,
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      );
    } else {
      throw ArgumentError('Invalid image type');
    }

    return imageWidget;
  }

}
