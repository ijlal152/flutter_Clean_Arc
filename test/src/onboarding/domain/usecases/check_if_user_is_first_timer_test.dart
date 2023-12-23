import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repo.mock.dart';

void main() {
  late MockOnboardingRepo repo;
  late CheckIfUserIsFirstTimer usecase;

  setUp(() {
    repo = MockOnboardingRepo();
    usecase = CheckIfUserIsFirstTimer(repo);
  });

  test(
      'should call the [onBoarding.chacheFirstTimer] '
          'and retrun the right data', () async {
    when(() => repo.checkIfUserIsFirstTimer()).thenAnswer((_) async {
      return const Right(
        true,
      );
    });

    final result = await usecase();
    expect(
      result,
      const Right<dynamic, bool>(
        true,
      ),
    );

    verify(() => repo.checkIfUserIsFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);

  });
}
