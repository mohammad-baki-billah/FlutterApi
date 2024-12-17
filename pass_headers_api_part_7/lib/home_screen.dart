import 'package:flutter/material.dart';
import 'package:pass_headers_api_part_7/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

dynamic userData;
bool isLoading = false;

class _HomeScreenState extends State<HomeScreen> {
  _getUserDetails() {
    isLoading = true;

    ApiServices().getUserDetails().then((value) {
      print('UserData ${value.toString}');
      setState(() {
        userData = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    _getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            'HomeScreen',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Center(
                child: Column(
                  children: [
                    Image.network(userData['avatar'].toString()),
                    Text(userData['name'].toString()),
                  ],
                ),
              ));
  }
}
