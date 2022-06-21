import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/basic_user_info.dart';
import 'package:hospital/pages/home_page.dart';
import 'package:hospital/pages/page.dart';
import 'package:hospital/providers/user_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<SLpage>(create: (BuildContext context) => SLpage()),
        ChangeNotifierProvider<UserInfo>(create: (BuildContext context) => UserInfo()),
        ChangeNotifierProvider<BasicUserInfo>(create: (BuildContext context) => BasicUserInfo()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CommonPage(),
      ),
    );
  }
}


class CommonPage extends StatefulWidget {
  const CommonPage({Key? key}) : super(key: key);

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Provider.of<SLpage>(context).Login,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: height * 0.2,
        centerTitle: true,
        title: SwitchListTile(
          activeColor: Colors.redAccent[400],
          autofocus: false,
          title: Provider.of<SLpage>(context).isLogin?
          Text("Sing In", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),):
          Text("Sing Up",  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          onChanged: (_){
            Provider.of<SLpage>(context, listen: false).toggleLogin();
          },
          value: Provider.of<SLpage>(context).isLogin,
        ),
      ),

    );

  }
}