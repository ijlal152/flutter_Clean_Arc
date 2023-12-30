// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_app/src/onboarding/domain/usecases/chache_first_timer.dart';
import 'package:exam_app/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({
    required CacheFirstTimer cacheFirstTimer,
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
}) : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnBoardingInitialState());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async{
    emit(const CacheFirstTimerState());
    final result = await _cacheFirstTimer();
    result.fold((failure) => emit(OnBoardingErrorState(failure.message)),
        (_) => const UserCachedState(),);
  }

  Future<void> checkIfUserIsFirstTimer() async{
    emit(const CheckingIfUserIsFirstTimerState());
    final result = await _checkIfUserIsFirstTimer();
    result.fold((failure) => emit(const OnBoardingStatusState(isFirstTimer: false)),
          (status) => emit(OnBoardingStatusState(isFirstTimer: status)),
    );
  }

}
