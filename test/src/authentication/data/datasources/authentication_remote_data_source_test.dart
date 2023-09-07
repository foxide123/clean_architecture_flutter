import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_flutter/core/utils/constants.dart';
import 'package:clean_architecture_flutter/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client{}

void main() {
  late http.Client client;
  late AuthenticationRemoteDataSource remoteDataSource;
  
  setUp((){
    client = MockClient();
    remoteDataSource = AuthenticationRemoteDataSourceImpl(client);
    registerFallbackValue(Uri());
  });

  group('createUser', (){
    test('should complete successfuly when the status code is 200 or 201', () async{
      when(()=> client.post(any(), body: any(named: 'body'))).thenAnswer((_) async => http.Response("User created successfully",201 ),);

      final methodCall = await remoteDataSource.createUser;

      expect(() => methodCall(createdAt: 'createdAt', name: 'name', avatar: 'avatar'), completes);
    
      verify(()=> client.post(Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
      body: jsonEncode({
        'createdAt': 'createdAt',
        'name': 'name',
        'avatar': 'avatar'
      }))).called(1);
    });
  });
}