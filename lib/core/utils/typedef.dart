import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

//generic type -t
typedef ResultFuture<T> =   Future<Either<Failure,T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;