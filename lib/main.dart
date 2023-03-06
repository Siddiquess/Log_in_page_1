import 'package:flutter/material.dart';
import 'package:my_snap/login_page/check_logged_in.dart';

const loggedAccount= 'UserLoggedIn';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "snap chat",
      home: CheckLoggedIn(),
    );
  }
}
