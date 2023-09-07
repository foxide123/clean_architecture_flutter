// what does the class depend on - authentication repository
// how can we create a fake version of the dependency

import 'package:clean_architecture_flutter/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:clean_architecture_flutter/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../authentication_repository.mock.dart';


void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);

    //registerFallbackValue(Football()) - allows to use any on property related to football class
  });

  final params = CreateUserParams.empty();

  test('should call the [AuthRepo.createUser]', () async {
    //Arrange
//stub
    when(() => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        )).thenAnswer((_) async => const Right(null));

    //thenAnswer - for async function
    //thenReutrn - not async function
    //Act
    final result = await usecase(params);
    //Assert
    expect(result, equals(const Right<dynamic, void>(null)));
    //verify that the function was called with the same params
    verify(() => repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
