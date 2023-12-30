// ignore_for_file: strict_raw_type

import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams{
  const CacheFirstTimer(this._onBoardingRepo);
  final OnBoardingRepo _onBoardingRepo;

  @override
  ResultFuture<void> call() async{
    return _onBoardingRepo.cacheFirstTimer();
  }


}
