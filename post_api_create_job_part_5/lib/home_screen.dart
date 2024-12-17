import 'package:flutter/material.dart';
import 'package:post_api_create_job_part_5/api_responces.dart';
import 'package:post_api_create_job_part_5/create_job_model.dart';
import 'package:post_api_create_job_part_5/see_my_job.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  CreatJobModel creatJobModel = CreatJobModel();
  bool isLoading = false;

  _gerCreateJob() {
    ApiResponces()
        .createJobModel(
            nameController.text.toString(), jobController.text.toString())
        .then((value) {
      setState(() {
        creatJobModel = value!;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  SeeMyJob(
              id: creatJobModel.id,
              name: creatJobModel.name,
              job: creatJobModel.job,
              
            )));
      });

      isLoading = false;
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      print(error);
    });
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
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: jobController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Job',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 58,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      _gerCreateJob();
                    });
                  },
                  child: isLoading == true
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
            )
          ],
        ),
      ),
    );
  }
}
