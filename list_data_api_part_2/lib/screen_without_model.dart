import 'package:flutter/material.dart';
import 'package:list_data_api_part_2/api_services.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  // bool isLoading = false;
  // dynamic withoutListModel = [];
  // _getListWithoutModel() {
  //   isLoading = true;
  //   ApiServices().getWithoutListModel().then((value) {
  //     setState(() {
  //       withoutListModel = value;
  //       isLoading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print(error);
  //   });
  // }

  // @override
  // void initState() {
  //   _getListWithoutModel();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          ' ScreenWithoutModel',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      // body: isLoading == true
      //     ? const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.green,
      //         ),
      //       )
      //     : ListView.builder(
      //         itemCount: withoutListModel.length,
      //         itemBuilder: (context, index) {
      //           return Card(
      //             elevation: 3,
      //             color: Colors.green.shade50,
      //             child: ListTile(
      //               leading: CircleAvatar(
      //                 backgroundColor: Colors.green.shade300,
      //                 radius: 20,
      //                 child: Text(
      //                   withoutListModel[index]['id'].toString(),
      //                   style: const TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20),
      //                 ),
      //               ),
      //               title: Text(
      //                 withoutListModel[index]['title'].toString(),
      //                 style: const TextStyle(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.green,
      //                 ),
      //               ),
      //               subtitle: Text(
      //                 withoutListModel[index]['body'].toString(),
      //                 style: const TextStyle(
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.w200,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      body: FutureBuilder(
          future: ApiServices().getWithoutListModel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.green.shade50,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            snapshot.data[index]['id'].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          snapshot.data[index]['title'].toString(),
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          snapshot.data[index]['body'].toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              color: Colors.black),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          }),
    );
  }
}
