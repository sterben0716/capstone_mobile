
import 'package:flutter/material.dart';
import 'package:capstone_clenro/utils/color_utils.dart';
import 'package:capstone_clenro/widgets/reusabale_widget.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringColor("#0081A7"),
              hexStringColor("#00AFB9"),
              hexStringColor("#A2FF86"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,
                MediaQuery.of(context).size.height *0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("images/signup.png"),
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(
                          Icons.alternate_email,
                          color: Colors.black
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.1,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.black
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.1,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
