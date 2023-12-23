import 'package:exam_app/core/utilities/typedef.dart';

abstract class OnBoardingRepo{

  const OnBoardingRepo();
  ResultFuture<void> cacheFirstTimer();

  ResultFuture<bool> checkIfUserIsFirstTimer();
}
