import 'package:api_integration_flutter_part_1/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePost = [];
  bool isLoading = false;
  _getSinglePostWithoutModel() {
    isLoading = true;
    ApiServices().getSinglePostWithoutModel().then((value) {
      setState(() {
        singlePost = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getSinglePostWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Without Model',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  singlePost['title'].toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  singlePost['body'].toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
    );
  }
}
