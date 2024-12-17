import 'dart:convert';

import 'package:api_integration_flutter_part_1/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // with model
  Future<SinglePostModel?> getSinglePostWithModel() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/posts/1';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        SinglePostModel singlePostModel =
            SinglePostModel.fromJson(json.decode(response.body));
        return singlePostModel;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //Without Model

  Future<dynamic> getSinglePostWithoutModel() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/posts';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = response.body;
        final data = jsonDecode(body);
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
