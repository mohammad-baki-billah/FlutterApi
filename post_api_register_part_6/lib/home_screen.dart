import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? id, token;
  const HomeScreen({super.key, this.id, this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'HomeScree',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('id: ${widget.id}', style:const TextStyle(fontSize: 20),),
            Text('token: ${widget.token}', style : const TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
