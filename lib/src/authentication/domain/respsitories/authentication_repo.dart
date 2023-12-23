
import 'package:exam_app/core/utilities/typedef.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser(
      {required String name,
      required String createdAt,
      required String avatar});

  ResultFuture<List<User>> getUsers();
}
