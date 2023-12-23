import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:exam_app/src/onboarding/domain/usecases/chache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repo.mock.dart';

void main() {
  late MockOnboardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnboardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
      'should call the [onBoarding.chacheFirstTimer] '
      'and retrun the right data', () async {
    when(() => repo.cacheFirstTimer()).thenAnswer((_) async {
      return Left(
        ServerFailure(
          message: 'Unknown error occurred',
          statusCode: 500,
        ),
      );
    });

    final result = await usecase();
    expect(
      result,
      equals(
        Left<Failure, dynamic>(
          ServerFailure(message: 'Unknown error occurred', statusCode: 500),
        ),
      ),
    );

    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);

  });
}
