
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser(
      {required String name,
      required String createdAt,
      required String avatar,});

  ResultFuture<List<User>> getUsers();
}
