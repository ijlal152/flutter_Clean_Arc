import 'package:exam_app/core/resources/media_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GradiantBackground extends StatelessWidget {
  const GradiantBackground({required this.image, required this.child, super.key});

  final String image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
