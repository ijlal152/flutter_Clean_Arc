// ignore_for_file: lines_longer_than_80_chars

import 'package:exam_app/core/common/views/loading_view.dart';
import 'package:exam_app/core/resources/colors.dart';
import 'package:exam_app/src/onboarding/domain/entities/page_content.dart';
import 'package:exam_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:exam_app/src/onboarding/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final pageController = PageController();

  @override
  void initState() {
    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state){
            if(state is OnBoardingStatusState && state.isFirstTimer == false){  // 3:43
              Navigator.pushReplacementNamed(context, '/home');
            }else if(state is UserCachedState){
              // push to the appropriate screen
            }
          },
          builder: (context, state){
            if(state is CheckingIfUserIsFirstTimerState || state is CacheFirstTimerState){
              return const LoadingView();
            }
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  children:  const[
                    OnBoardingBody(pageContent: PageContent.first()),
                    OnBoardingBody(pageContent: PageContent.second()),
                    OnBoardingBody(pageContent: PageContent.third()),
                  ],
                ),
                Align(
                      alignment: const Alignment(0, .04),
                      child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                        onDotClicked: (index){
                            pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                            );
                        },
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 40,
                          activeDotColor: Colours.primaryColour,
                          dotColor: Colors.white,
                        ),
                      ),
                    ),
              ],
            );
          },
      ),
    );
  }
}
