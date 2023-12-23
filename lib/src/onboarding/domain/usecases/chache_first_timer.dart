import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams{
  const CacheFirstTimer(this._onBoardingRepo);
  final OnBoardingRepo _onBoardingRepo;

  @override
  ResultFuture<void> call() async{
    // TODO: implement call
    return _onBoardingRepo.cacheFirstTimer();
  }


}
