import 'package:flutter/material.dart';
import 'package:multi_data_api_part_3/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  bool isLoading = false;
  dynamic multiDataModel;
  _getWihoutModelData() {
    isLoading = true;
    ApiServices().getMultiDataWithoutModel().then((value) {
      setState(() {
        multiDataModel = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      print(error);
    });
  }

  @override
  void initState() {
    _getWihoutModelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text(
            'ScreenWithoutModel',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(multiDataModel['page'].toString()),
                  Text(multiDataModel['per_page'].toString()),
                  Text(multiDataModel['total'].toString()),
                  Expanded(
                    child: ListView.builder(
                        itemCount: multiDataModel['data'].length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(multiDataModel['data'][index]['name']
                                    .toString()),
                                Text(multiDataModel['data'][index]['year']
                                    .toString())
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ));
  }
}
