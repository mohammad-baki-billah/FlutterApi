import 'package:flutter/material.dart';
import 'package:login_post_api_part_4/api_services.dart';
import 'package:login_post_api_part_4/home_screen.dart';
import 'package:login_post_api_part_4/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel loginModel = LoginModel();
  bool isLoading = false;
// With Model
  _getUserLogin() {
    ApiServices()
        .getLoginWithModel(
      emailController.text,
      passwordController.text,
    )
        .then((value) {
      if (value != null) {
        setState(() {
          loginModel = value;
          print(loginModel.token.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                token: loginModel.token.toString(),
              ),
            ),
          );
          isLoading = false;
        });
      } else {
        // Handle the null case (e.g., show an error message)
        print("Login failed. No data received.");
      }
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      print(error);
    });
  }

//Without Model
  _getLoginWithoutModel() {
    ApiServices()
        .getLoginWithoutModel(
            emailController.text.toString(), passwordController.text.toString())
        .then((value) {
      setState(() {
        isLoading = false;
        print(value['token'].toString());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              token: value['token'].toString(),
            ),
          ),
        );
      });
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
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'LogInScreen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 150,
                height: 45,
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
                    });
                    // With Model
                    //_getUserLogin();

                    //Without Model

                    _getLoginWithoutModel();
                  },
                  child: isLoading==true? const CircularProgressIndicator( color: Colors.white,): const Text(
                    'LogIn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
