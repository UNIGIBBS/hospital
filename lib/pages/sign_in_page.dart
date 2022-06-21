import 'package:flutter/material.dart';
import 'package:hospital/providers/user_info.dart';
import 'package:provider/provider.dart';

import '../models/basic_user_info.dart';
import '../services/server_handler.dart';
import '../widgets/SingInUpButton.dart';
import 'forgot_password_page.dart';
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? text = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: size.height,
          child: ListView(children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.1,
                  ),
                  //Text("LOGIN", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 20),
                    child: TextField(
                      onChanged: (value) {},
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.redAccent))),
                    ),
                  ),

                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 20),
                    child: TextField(
                      onChanged: (value) {},
                      obscureText: _obscureText,
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIconColor: Colors.redAccent,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(
                                    Icons.visibility,
                                  ),
                            onPressed: _toggle,
                          ),
                          labelText: "Password ",
                          hintText: "Password ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.redAccent))),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SingInSingUpButton(
                    context: context,
                    isLogin: true,
                    boyut: 0.8,
                    onTap: () async{
                      Map<dynamic, dynamic>? resultMapRegisterUser =
                          await ServerHandler().loginUser(emailController.text, passwordController.text);
                      print("User was added");
                      if (resultMapRegisterUser!['success'] == 1){
                        print("USER REGISTERED");
                        print(resultMapRegisterUser['message']);
                        Provider.of<UserInfo>(context, listen: false).setMail(emailController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      }
                      else {
                        print("USER NOT REGISTERED");
                        print(resultMapRegisterUser['message']);
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
                      child: Text("Forgot Password?"))
                ],
              ),
            ),
          ])),
    );
  }
}
