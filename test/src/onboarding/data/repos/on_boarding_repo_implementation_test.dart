import 'package:dartz/dartz.dart';
import 'package:exam_app/src/onboarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:exam_app/src/onboarding/data/repos/on_boarding_repo_implementation.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';


class MockOnBoardingLocalDataSrc extends Mock implements OnBoardingLocalDataSource{}

void main(){
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImplementation repoImplementation;

  setUp(() {
    localDataSource = MockOnBoardingLocalDataSrc();
    repoImplementation = OnBoardingRepoImplementation(localDataSource);
  });

  test('should be sub class of [OnBoardingRepo]', () {
    expect(repoImplementation, isA<OnBoardingRepo>());
  });
  
  group('cacheFirstTimer', () {
    test('should complete successfully when call to local source is successful '
        , () async{
      when(() => localDataSource.cacheFirstTimer()).thenAnswer((_) async
      => Future.value(),
      );
      final result = repoImplementation.cacheFirstTimer();

      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
      }
  );


}