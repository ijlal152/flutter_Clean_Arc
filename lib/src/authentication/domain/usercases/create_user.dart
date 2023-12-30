// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/domain/respsitories/authentication_repo.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams>{

  CreateUser(this._authenticationRepository);
  final AuthenticationRepository _authenticationRepository;


  @override
  ResultVoid call(CreateUserParams params) async => _authenticationRepository.createUser(
      name: params.name,
      createdAt: params.createdAt,
      avatar: params.avatar,
  );
}

class CreateUserParams extends Equatable{

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty() :
      this(createdAt: 'empty.createdAt', name: 'empty.name', avatar: 'empty.avatar');
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
