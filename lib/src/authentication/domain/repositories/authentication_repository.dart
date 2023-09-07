import 'package:clean_architecture_flutter/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user.dart';

abstract class AuthenticationRepository{
  const AuthenticationRepository();


//Exceptions will be stored in data layer

//we state we have failure instead of ApiFailure (loose coupling)
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar
  });

  ResultFuture<List<User>> getUsers();
}