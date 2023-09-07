import 'package:clean_architecture_flutter/core/usecase/usecase.dart';
import 'package:clean_architecture_flutter/core/utils/typedef.dart';

import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>>{

  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers(); 
}