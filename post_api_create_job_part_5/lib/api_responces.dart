import 'dart:convert';

import 'package:post_api_create_job_part_5/create_job_model.dart';
import 'package:http/http.dart' as http;

class ApiResponces {
  // With Model
  Future<CreatJobModel?> createJobModel(String name, String job) async {
    try {
      var url = 'https://reqres.in/api/users';
      var resposne =
          await http.post(Uri.parse(url), body: {"name": name, "job": job});

      if (resposne.statusCode == 201) {
        CreatJobModel creatJobModel =
            CreatJobModel.fromJson(json.decode(resposne.body));
        return creatJobModel;
      }
    } catch (e) {
      print('APi is not working $e');
    }
    return null;
  }
}
