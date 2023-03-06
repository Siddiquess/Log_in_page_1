
import 'package:flutter/material.dart';
import 'package:my_snap/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page/home_page.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // =========== Text Field One =============== //
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the username';
                  } else {
                    return null;
                  }
                },
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text('User name'),
                ),
              ),
              // =========== Text Field Two =============== //
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the password';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: const Text('Password'),
                  ),
                ),
              ),
              // ================ Log In Button ================= //
              ElevatedButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  minimumSize: MaterialStatePropertyAll(Size(340, 50)),
                  textStyle: MaterialStatePropertyAll(
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    checkLogin(context);
                  }
                },
                child: const Text('Log In'),
              )
            ],
          ),
        ),
      ),
    ));
  }

  // ============= Functions ================= //

  void checkLogin(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'siddique' && password == '12345') {
      // Go TO Home
      final sharedprfrnc = await SharedPreferences.getInstance();
      await sharedprfrnc.setBool(loggedAccount, true);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[700],
          content: const Text('Username or Password does not match')));
    }
    
  }

  
}
