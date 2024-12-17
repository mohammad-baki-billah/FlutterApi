import 'dart:convert';

import 'package:flutter_application_1/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<UserModel?> getUsers() async {
    try {
      var url = 'https://dummyjson.com/users';

      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print('API Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('API Error: $e');
    }
    return null;
  }
}
