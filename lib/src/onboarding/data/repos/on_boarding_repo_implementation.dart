import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/exceptions.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/onboarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';

class OnBoardingRepoImplementation implements OnBoardingRepo{
  OnBoardingRepoImplementation(this._onBoardingLocalDataSource);

  final OnBoardingLocalDataSource _onBoardingLocalDataSource;
  @override
  ResultFuture<void> cacheFirstTimer() async{
    try{
      await _onBoardingLocalDataSource.cacheFirstTimer();
      return const Right(null);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async{
    try{
      final result = await _onBoardingLocalDataSource.checkIfUserIsFirstTimer();
      return Right(result);
    }on CacheException catch(e){
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

}