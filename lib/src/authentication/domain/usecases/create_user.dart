import 'package:clean_architecture_flutter/core/usecase/usecase.dart';
import 'package:clean_architecture_flutter/core/utils/typedef.dart';
import 'package:clean_architecture_flutter/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(CreateUserParams params) async => _repository.createUser(
        avatar: params.avatar,
        createdAt: params.createdAt,
        name: params.name,
      );
}

class CreateUserParams extends Equatable {

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar
  });

//will return empty class
  const CreateUserParams.empty() :
  this(createdAt: "_empty_string", name: "_empty_stirng", avatar: "_empty_string");

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
