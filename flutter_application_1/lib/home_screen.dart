import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_services.dart';
import 'package:flutter_application_1/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  UserModel userModel = UserModel();
  bool isLoading = false;

  _getUserApi() {
    isLoading = true;
    ApiServices().getUsers().then((value) {
      print(value!.users![0].age);
      _maleList(value.users!);
      _femaleList(value.users!);
      setState(() {
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
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    _getUserApi();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Users> malelist = [];
  List<Users> _maleList(List<Users> users) {
    for (var element in users) {
      if (element.gender == 'male') {
        malelist.add(element);
      }
    }
    return malelist;
  }

  List<Users> femaleList = [];
  List<Users> _femaleList(List<Users> users) {
    for (var element in users) {
      if (element.gender == 'female') {
        femaleList.add(element);
      }
    }
    return femaleList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'HomeScreen',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Column(
                children: [
                  Icon(
                    Icons.male,
                    color: Colors.white,
                  ),
                  Text(
                    'Male',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                children: [
                  Icon(
                    Icons.female,
                    color: Colors.white,
                  ),
                  Text(
                    'Female',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(controller: tabController, children: [
                Center(
                  child: _maleUser(),
                ),
                Center(
                  child: _femaleUser(),
                ),
              ]),
          ),
    );
  }

  _maleUser() {
    return ListView.builder(
        itemCount: malelist.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(malelist[index].image.toString()),
              ),
              title: Text(malelist[index].username.toString()),
              subtitle: Text(
                malelist[index].email.toString(),
              ),
            ),
          );
        });
  }

  _femaleUser() {
    return ListView.builder(
        itemCount: femaleList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(femaleList[index].image.toString()),
              ),
              title: Text(femaleList[index].username.toString()),
              subtitle: Text(femaleList[index].email.toString()),
            ),
          );
        });
  }
}
