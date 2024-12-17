import 'package:api_integration_flutter_part_1/api_services.dart';
import 'package:api_integration_flutter_part_1/single_post_model.dart';
import 'package:flutter/material.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {
  SinglePostModel singlePostModel = SinglePostModel();

  bool isRaday = false;
  _getSinglePost() {
    ApiServices().getSinglePostWithModel().then((value) {
      isRaday = true;
      setState(() {
        singlePostModel = value!;

        isRaday = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isRaday = false;
      });
    });
  }

  @override
  void initState() {
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'With Model',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: isRaday == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  singlePostModel.title.toString(),
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text(
                  textAlign: TextAlign.center,
                  singlePostModel.body.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
    );
  }
}
