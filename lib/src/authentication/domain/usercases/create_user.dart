import 'package:equatable/equatable.dart';
import 'package:exam_app/core/usecase/usecase.dart';
import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/domain/respsitories/authentication_repo.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams>{
  final AuthenticationRepository _authenticationRepository;

  CreateUser(this._authenticationRepository);


  @override
  ResultVoid call(CreateUserParams params) async => _authenticationRepository.createUser(
      name: params.name,
      createdAt: params.createdAt,
      avatar: params.avatar
  );
}

class CreateUserParams extends Equatable{
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty() :
      this(createdAt: 'empty.createdAt', name: 'empty.name', avatar: 'empty.avatar');

  @override
  // TODO: implement props
  List<Object?> get props => [createdAt, name, avatar];
}