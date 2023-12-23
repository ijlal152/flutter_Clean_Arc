import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool>{
  const CheckIfUserIsFirstTimer(this._onBoardingRepo);
  final OnBoardingRepo _onBoardingRepo;
  @override
  ResultFuture<bool> call() {
    return _onBoardingRepo.checkIfUserIsFirstTimer();
  }

}
