import 'package:flutter/material.dart';
import 'package:multi_data_api_part_3/api_services.dart';
import 'package:multi_data_api_part_3/multi_data_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  MultiDataModel multiDataModel = MultiDataModel();
  bool isLoading = false;
  _getMultidataModel() {
    isLoading = true;
    ApiServices().getWithMultidataModel().then((value) {
      setState(() {
        multiDataModel = value!;
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
    _getMultidataModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            'ScreenWithModel',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Column(
                children: [
                  Container(
                    color: Colors.green.shade200,
                    child: Column(
                      children: [
                        Text(multiDataModel.total.toString()),
                        Text(multiDataModel.page.toString()),
                        Text(multiDataModel.perPage.toString()),
                        Text(multiDataModel.support!.url.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: multiDataModel.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${multiDataModel.data![index].name.toString()}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Text(
                                  'Year: ${multiDataModel.data![index].year.toString()}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                                Text(multiDataModel.data![index].color
                                    .toString()),
                                Text(multiDataModel.data![index].pantoneValue
                                    .toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
