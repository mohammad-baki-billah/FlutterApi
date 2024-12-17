import 'dart:convert';

import 'package:list_data_api_part_2/list_post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  // With Model
  Future<List<ListPostModel>?> getListWithModel() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/posts';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<ListPostModel> listModel = List<ListPostModel>.from(
          json.decode(response.body).map(
                (x) => ListPostModel.fromJson(x),
              ),
        );
        return listModel;
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
    return null;
  }

  // Without Model

  Future<dynamic> getWithoutListModel() async {
    try {
      var url = 'https://jsonplaceholder.typicode.com/posts';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final listModel = jsonDecode(response.body);
        return listModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
