part of 'on_boarding_cubit.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitialState extends OnBoardingState {
  const OnBoardingInitialState();
}

class CacheFirstTimerState extends OnBoardingState {
  const CacheFirstTimerState();
}

class CheckingIfUserIsFirstTimerState extends OnBoardingState {
  const CheckingIfUserIsFirstTimerState();
}

class UserCachedState extends OnBoardingState{
  const UserCachedState();
}

class OnBoardingStatusState extends OnBoardingState{
  const OnBoardingStatusState({required this.isFirstTimer});

  final bool isFirstTimer;

  @override
  List<bool> get props => [isFirstTimer];
}

class OnBoardingErrorState extends OnBoardingState{
  const OnBoardingErrorState(this.message);
  final String message;

  @override
  List<String> get props => [message];
}
