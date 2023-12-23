import 'package:exam_app/core/common/widgets/gradiant_background.dart';
import 'package:exam_app/core/resources/media_res.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantBackground(
          image: MediaRes.onBoardingBackground,
          child: Center(child: Lottie.asset(MediaRes.pageUnderConstruction),),
      ),
    );
  }
}
