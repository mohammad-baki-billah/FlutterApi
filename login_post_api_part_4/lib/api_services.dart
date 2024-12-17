import 'dart:convert';

import 'package:login_post_api_part_4/login_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // With Model
  Future<LoginModel?> getLoginWithModel(String email, String password) async {
    try {
      var url = 'https://reqres.in/api/login';
      var response = await http
          .post(Uri.parse(url), body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(json.decode(response.body));
        return loginModel;
      }
    } catch (e) {
      print("Error in API call: $e");
    }
    return null;
  }

// Without Model
  Future<dynamic> getLoginWithoutModel(String email, String password) async {
    try {
      var url = 'https://reqres.in/api/login';
      var response = await http
          .post(Uri.parse(url), body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        final listModel = json.decode(response.body);
        return listModel;
      }
    } catch (e) {
      print('Error in Api call: $e');
    }
  }
}
