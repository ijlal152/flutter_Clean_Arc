import 'package:exam_app/core/extensions/context_extensions.dart';
import 'package:exam_app/core/resources/fonts.dart';
import 'package:exam_app/src/onboarding/domain/entities/page_content.dart';
import 'package:flutter/material.dart';
class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pageContent.img, height: context.height * .4,),
        SizedBox(height: context.height * .03,),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Text(pageContent.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: Fonts.aeonik,
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),),
        )
      ],
    );
  }
}
