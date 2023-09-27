import 'package:flutter/material.dart';
import 'package:capstone_clenro/UI/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CLENRO',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const LoginPage()
    );
  }
}
