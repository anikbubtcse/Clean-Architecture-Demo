import 'dart:convert';

import 'package:clean_architecture_demo/core/constants/constants.dart';

import '../../../../core/error/exception.dart';
import '../models/users_model.dart';
import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSource {
  Future<List<UsersModel>> getUsersInfo(String id);
}

class UsersRemoteDataSourceImp extends UsersRemoteDataSource {
  final http.Client client;

  UsersRemoteDataSourceImp({required this.client});

  @override
  Future<List<UsersModel>> getUsersInfo(String id) async {
    final response = await client.get(Uri.parse(Constants.getUrl(id)));

    if (response.statusCode == 200) {
      final result = List<UsersModel>.from(
          json.decode(response.body).map((x) => UsersModel.fromJson(x)));

      return result;
    } else {
      throw ServerException();
    }
  }
}
