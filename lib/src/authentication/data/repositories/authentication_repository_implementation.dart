import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:exam_app/src/authentication/domain/entities/user.dart';
import 'package:exam_app/src/authentication/domain/respsitories/authentication_repo.dart';

class AuthenticationRepoImplementation implements AuthenticationRepository{

  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepoImplementation(this._remoteDataSource);


  @override
  ResultVoid createUser({required String name, required String createdAt, required String avatar}) async{

    // Test Driven Development
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() async{
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}