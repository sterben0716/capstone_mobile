import 'dart:convert' as convert;
import 'package:capstone_clenro/UI/login_page.dart';
import 'package:capstone_clenro/UI/otp_screen.dart';
import 'package:capstone_clenro/api_provider/api.dart';
import 'package:flutter/material.dart';
import 'package:capstone_clenro/utils/color_utils.dart';
import 'package:capstone_clenro/widgets/reusabale_widget.dart';
import 'package:google_fonts/google_fonts.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  ApiProvider api = ApiProvider();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void verifyUserEmail(String email, String route) async {
    try{
      var response = await api.emailConfirmation(email, route);
      var emailVerify = convert.json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const OTPScreen()), (route) => false);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(emailVerify['message'].toString())));
      }
    }
    catch (error) {
      print(error);
    }
  }

  @override


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF009E60),
        elevation: 0,
        title: Text("Forgot Password",
          style: GoogleFonts.sofiaSans(),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logofWidget("images/forgot.png"),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      '   Forgot Password?',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sofiaSans(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                      '     enter a valid email address to reset your password?',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.sofiaSans(
                        color: Colors.black,
                        fontSize: 15.0,
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    verifyUserEmail(emailController.text, 'password_reset');
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
                        'Send Verification',
                        style: GoogleFonts.sofiaSans(
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
