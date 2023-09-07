import 'package:clean_architecture_flutter/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params>{

  const UsecaseWithParams();
  //every function has call() functionality
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type>{
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}