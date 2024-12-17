import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<dynamic> getUserDetails() async {
    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTczMzE0ODM4MiwiZXhwIjoxNzM0ODc2MzgyfQ.E9G0-n0R_mrKY9Ez03bkABBXqLHAQe2jppVXzUPmWB0";

      var url = 'https://api.escuelajs.co/api/v1/auth/profile';
      var response = await http.get(
        Uri.parse(url),
        headers: ({"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Api Response Error $e');
    }
  }
}
