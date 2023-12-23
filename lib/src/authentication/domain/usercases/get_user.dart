import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/domain/entities/user.dart';
import 'package:exam_app/src/authentication/domain/respsitories/authentication_repo.dart';

class GetUsers extends UsecaseWithoutParams<List<User>>{

  final AuthenticationRepository _authenticationRepository;
  GetUsers(this._authenticationRepository);

  @override
  ResultFuture<List<User>> call() async => _authenticationRepository.getUsers();



}