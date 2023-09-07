import 'dart:convert';

import 'package:clean_architecture_flutter/src/authentication/data/models/user_model.dart';
import 'package:clean_architecture_flutter/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io';
import '../../../../fixtures/fixture_reader.dart';
import 'package:clean_architecture_flutter/core/utils/typedef.dart';

void main() {
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {
    //Arrange

    //Act

    //Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      //Arrange
      //Act
      final result = UserModel.fromMap(tMap);
      //final result = UserModel.fromMap(map);
      //Assert
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      //Arrange
      //Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [Map] with the right data', () {
      //Arrange
      //Act
      final result = tModel.toMap();
      //Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      //Arrange
      //Act
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "avatar": "_empty.avatar",
        "createdAt": "_empty.createdAt",
        "name": "_empty.name"
      });
      //Assert
      expect(result, tJson);
    });
  });

  group('copyWith', (){
    test("should return [UserModel] with different data",(){
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals("Paul"));
    });
  });
}
