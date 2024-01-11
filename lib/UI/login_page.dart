import 'package:capstone_clenro/UI/forgot_password.dart';
import 'package:capstone_clenro/models/user.dart';
import 'package:capstone_clenro/api_provider/api.dart';
import 'package:capstone_clenro/widgets/navigation.dart';
import 'package:capstone_clenro/widgets/reusabale_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;

import '../utils/color_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _isObscured;

  @override
  void initState(){
    super.initState();
    _isObscured = true;
  }

  ApiProvider api = ApiProvider();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void logInUser(String username, String password, String route) async {
    try {
      var response = await api.login(username, password, route);
      var user = convert.json.decode(response.body);
      if (response.statusCode == 200) {
        print(user);
        User saveAuth = User(
          id: user['user']['id'],
          username: user['user']['username'],
          userRole: user['user']['userRole'],
          email: user['user']['email'],
          gender: user['user']['gender'],
          token: user['user']['token']['accessToken'],
        );
        // String jsonString = convert.json.encode(saveAuth.dataToJSON());
        // print(jsonString);

        await saveAuth.saveUser();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const Navigation()), (route) => false);

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(user['message'].toString())));
      }
    } catch (error) {
      print(error);
    }
  }

  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.19, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logoWidget("images/logo1.png"),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '  Sign In',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sofiaSans(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usernameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'exampleuser@gmail.com',
                      prefixIcon: const Icon(
                          Icons.alternate_email,
                          color: Colors.teal
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 0.1,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.teal
                      ),
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        icon: _isObscured ?
                        const Icon(Icons.visibility, color: Colors.teal,) :
                        const Icon(Icons.visibility_off, color: Colors.teal,),
                        onPressed: (){
                          setState(() {
                            _isObscured =! _isObscured;
                          });
                        },
                      ),
                      labelStyle: TextStyle(color: Colors.black26.withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    logInUser(usernameController.text, passwordController.text, 'auth/signin');
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.teal[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.sofiaSans(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                forgotPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Forgot Password?",
            style: GoogleFonts.sofiaSans(color: Colors.black)
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
            },
            child: Text (
              " click here",
              style: GoogleFonts.sofiaSans(color: Colors.black,fontWeight: FontWeight.bold),
            )
        )
      ],
    );
  }
}




