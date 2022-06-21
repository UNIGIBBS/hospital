import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital/models/user.dart';
import 'package:hospital/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/basic_user_info.dart';
import '../providers/user_info.dart';
import '../services/server_handler.dart';
import '../widgets/SingInUpButton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? text = "";
  TextEditingController userNameController = TextEditingController();
  TextEditingController userSurnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  Future register() async {
    var url = "http://10.34.13.71:4443/hospital/resigter.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": emailController.text,
      "password": passwordController.text
    });

    var data = json.decode(json.encode(response.body));
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "This User already exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      print(data.toString());
      Fluttertoast.showToast(
          msg: "Registration Successfull!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: width,
          height: size.height,
          child: ListView(children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.03,
                  ),
                  // Text("SIGNUP", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 8),
                    child: TextField(
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      controller: userNameController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "User Name",
                          hintText: "User Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.redAccent))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 8),
                    child: TextField(
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      controller: userSurnameController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "User Surname",
                          hintText: "User Surname",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.redAccent))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 8),
                    child: TextField(
                      onChanged: (value) {},
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.redAccent))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 8, width * 0.05, 8),
                    child: TextField(
                      obscureText: _obscureText,
                      onChanged: (value) {},
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: _toggle,
                          ),
                          labelText: "Password",
                          hintText: "Password",
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
                      cursorColor: Colors.redAccent,
                      obscureText: _obscureText,
                      keyboardType: TextInputType.text,
                      controller: passwordController2,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: _obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: _toggle,
                          ),
                          labelText: "Password Again",
                          hintText: "Password Again",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.redAccent,
                                  style: BorderStyle.solid))),
                    ),
                  ),
                  SingInSingUpButton(
                    context: context,
                    isLogin: false,
                    boyut: 0.8,
                    onTap: () async {
                      print("User will be added");
                      Provider.of<BasicUserInfo>(context, listen: false).updateAllUserInfo(User(email: emailController.text, password: passwordController.text, name: userNameController.text, surname: userSurnameController.text));
                      print(Provider.of<BasicUserInfo>(context, listen: false)
                          .basicUser);
                      Map<dynamic, dynamic>? resultMapRegisterUser =
                          await ServerHandler().registerUser(
                              Provider.of<BasicUserInfo>(context, listen: false)
                                  .basicUser);
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
                    height: size.height * 0.0001,
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
