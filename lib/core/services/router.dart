
import 'package:exam_app/core/common/views/page_under_construction.dart';
import 'package:exam_app/core/services/injection_container.dart';
import 'package:exam_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:exam_app/src/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case OnBoardingScreen.routeName:
      return _pageBuilder(
              (_) => BlocProvider(
            create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingScreen(),),
          settings: settings,
      );

    default:
      // ignore: lines_longer_than_80_chars
      return _pageBuilder((_) => const PageUnderConstruction(), settings: settings);
  }
}

// ignore: lines_longer_than_80_chars
PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page, {required RouteSettings settings}){
  return PageRouteBuilder(
    settings: settings,
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child,),
      pageBuilder: (context, _, __) => page(context),
  );
}
