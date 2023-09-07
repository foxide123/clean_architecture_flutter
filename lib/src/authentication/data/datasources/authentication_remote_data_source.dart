import 'dart:convert';

import '../../../../core/utils/constants.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndpoint = '/users';
const kGetUsersEndpoint = '/users';

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  
  const AuthenticationRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    final response = await _client.post(Uri.parse('$kBaseUrl$kCreateUserEndpoint'), body: jsonEncode({
      'createdAt': createdAt,
      'name': name, 
      'avatar': avatar
    }));
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
