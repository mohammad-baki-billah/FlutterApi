import 'package:flutter/material.dart';
import 'package:list_data_api_part_2/api_services.dart';
import 'package:list_data_api_part_2/list_post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  bool isLoading = false;
  List<ListPostModel> listModel = [];

  _getListWithModel() {
    isLoading = true;
    ApiServices().getListWithModel().then((value) {
      setState(() {
        listModel = value!;
        isLoading = false;
      });
    }).onError(
      (error, stackTrace) {
        setState(() {
          isLoading = false;
        });
        print(error);
      },
    );
  }

  @override
  void initState() {
    _getListWithModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "ScreenWithModel",
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
          : ListView.builder(
              itemCount: listModel.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Colors.green.shade50,
                  child: ListTile(
                    title: Text(
                      listModel[index].title.toString(),
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      listModel[index].body.toString(),
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
