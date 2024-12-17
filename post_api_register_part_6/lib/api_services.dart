import 'dart:convert';

import 'package:post_api_register_part_6/register_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // With Model
  Future<RegisterModel?> gerRegisterModel(String email, String password) async {
    try {
      var url = 'https://reqres.in/api/register';
      var response = await http.post(Uri.parse(url), body: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        RegisterModel registerModel =
            RegisterModel.fromJson(json.decode(response.body));
        return registerModel;
      }
    } catch (e) {
      print('Response error $e');
    }
    return null;
  }
}
