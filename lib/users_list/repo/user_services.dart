import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_demo/users_list/models/users_list_model.dart';
import 'package:mvvm_demo/users_list/repo/api_status.dart';
import 'package:mvvm_demo/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(usersList);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            response: usersListModelFromJson(response.body), code: 200);
      }
      return Failure(response: 'invalid response', code: invalidResponse);
    } on HttpException {
      return Failure(response: 'No internet connection', code: noInternet);
    } on SocketException {
      return Failure(response: 'No internet connection', code: noInternet);
    }
     on FormatException {
      return Failure(response: 'Invalid format', code: invalidFormat);
    } catch (e) {
      return Failure(response: 'Unknown error', code: unknownError);
    }
  }
}
