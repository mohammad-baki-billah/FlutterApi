import 'package:flutter/material.dart';

class SeeMyJob extends StatefulWidget {
  final String? id;
  final String? name;
  final String? job;
  const SeeMyJob({this.id, super.key, this.name, this.job, });

  @override
  State<SeeMyJob> createState() => _SeeMyJobState();
}

class _SeeMyJobState extends State<SeeMyJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'MyJob',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body:  Column(
        children: [
          Text('Id : ${widget.id}'),
          Text('name : ${widget.name}'),
          Text('Job : ${widget.job}'),
        ],
      ),
    );
  }
}
