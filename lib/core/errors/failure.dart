import 'package:equatable/equatable.dart';
import 'package:exam_app/core/errors/exceptions.dart';


abstract class Failure extends Equatable{

  Failure({required this.message, required this.statusCode}) : assert(
  statusCode is int || statusCode is String,
  'StatusCode can not be a ${statusCode.runtimeType}',
  );
  final String message;
  final dynamic statusCode;

  String get errorMessage =>  '$statusCode Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ApiFailure extends Failure{
  ApiFailure({required super.message, required super.statusCode});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, required super.statusCode});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this (
      message: exception.message,
      statusCode: exception.statusCode,);
}
