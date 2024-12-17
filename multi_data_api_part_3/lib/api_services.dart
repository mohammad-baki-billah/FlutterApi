import 'dart:convert';

import 'package:multi_data_api_part_3/multi_data_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // With Model
  Future<MultiDataModel?> getWithMultidataModel() async {
    try {
      var url = 'https://reqres.in/api/unknown';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        MultiDataModel multiDataModel =
            MultiDataModel.fromJson(json.decode(response.body));
        return multiDataModel;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Without Model
  Future<dynamic> getMultiDataWithoutModel() async {
    var url = 'https://reqres.in/api/unknown';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final multiDataModel =jsonDecode(response.body);
        return multiDataModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
