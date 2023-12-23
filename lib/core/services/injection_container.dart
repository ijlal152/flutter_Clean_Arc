import 'package:exam_app/src/onboarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:exam_app/src/onboarding/data/repos/on_boarding_repo_implementation.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:exam_app/src/onboarding/domain/usecases/chache_first_timer.dart';
import 'package:exam_app/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:exam_app/src/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
final sl = GetIt.instance;

Future<void> init() async{
  final prefs = await SharedPreferences.getInstance();
  sl..registerFactory(() => OnBoardingCubit(
      cacheFirstTimer: sl(),
      checkIfUserIsFirstTimer: sl(),
  ),
  )

  ..registerLazySingleton(() => CacheFirstTimer(sl()))
  ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
  ..registerLazySingleton<OnBoardingRepo>(() =>
      OnBoardingRepoImplementation(sl()),)
  ..registerLazySingleton<OnBoardingLocalDataSource>(() =>
      OnBoardingLocalDataSourceDataImp(sl()),)
  ..registerLazySingleton(() => prefs);

}
