import 'package:flutter/material.dart';
import 'package:my_snap/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_page/home_page.dart';
import '../main.dart';

class CheckLoggedIn extends StatefulWidget {
  const CheckLoggedIn({super.key});

  @override
  State<CheckLoggedIn> createState() => _CheckLoggedInState();
}

class _CheckLoggedInState extends State<CheckLoggedIn> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> checkUserLoggedIn() async {
    final sharedprfrnc = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfrnc.getBool(loggedAccount);

    if (userLoggedIn == null || userLoggedIn == false) {
      toLoginPage();
    } else {
      toHomePage();
    }
  }

  void toLoginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => LoginPage())));
  }

  void toHomePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const HomePage())));
  }
}
