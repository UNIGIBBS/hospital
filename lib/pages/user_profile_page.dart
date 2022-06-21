import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital/providers/user_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../services/server_handler.dart';

const Color customBackground = Color(0xffe6e6ec);
const Color customRed = Colors.redAccent;
const Color customOceanBlue = Color(0xff638181);
const Color customBlack54 = Colors.black54;
const Color customBackgroundWhite = Colors.white;

const TextStyle customHeadline1 =
TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: customBlack54);
const TextStyle customHeadline2 =
TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: customRed);
const TextStyle customBodyText =
TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: customBlack54);


class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  var _picker = ImagePicker();

  var name;
  var surname;
  var password;
  var user_id;
  var email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    Map<dynamic, dynamic>? resultMapRegisterUser =
    await ServerHandler().fetchOneUser(Provider.of<UserInfo>(context, listen:  false).mail);
    print("User was added");
    if (resultMapRegisterUser!['success'] == 1){
      print("USER REGISTERED");
      print(resultMapRegisterUser['message']);
      name = resultMapRegisterUser["user"]["name"];
      surname = resultMapRegisterUser["user"]["surname"];
      password = resultMapRegisterUser["user"]["password"];
      user_id = resultMapRegisterUser["user"]["user_id"];
      email = resultMapRegisterUser["user"]["email"];
      print(name);
      print(surname);
      print(password);
    }
    else {
      print("USER NOT REGISTERED");
      print(resultMapRegisterUser['message']);
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                CircleAvatar(
                  radius: width*0.14+2,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: width*0.14-2,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: width*0.14-6,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: width*0.14-10,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                      ),
                    ),
                  ),
                ),
                Center(
                  child:  FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Text(
                            "",
                            style: TextStyle(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                                fontStyle: FontStyle.italic
                            ),
                          );
                        }else{
                          return Text(
                            name+" "+surname,
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                                fontStyle: FontStyle.italic
                            ),
                          );
                        }
                      }
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width/6,
                            child: FittedBox(
                              child: Text(
                                "Name      ",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width/6*5-74,
                                      child: FutureBuilder(
                                        future: getData(),
                                        builder: (context, snapshot) {
                                          if(snapshot.connectionState == ConnectionState.waiting){
                                            return Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: height * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[800],
                                                  fontStyle: FontStyle.italic
                                              ),
                                            );
                                          }else{
                                            return Text(
                                              name,
                                              style: TextStyle(
                                                  fontSize: height * 0.02,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[800],
                                                  fontStyle: FontStyle.italic
                                              ),
                                            );
                                          }
                                        }
                                      ),
                                    ),
                                    Expanded(
                                        child: IconButton(
                                            onPressed: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return GestureDetector(
                                                      onTap: (){
                                                        FocusScopeNode currentScope = FocusScope.of(context);

                                                        if (!currentScope.hasPrimaryFocus) {
                                                          currentScope.unfocus();
                                                        }
                                                      },
                                                      child: AlertDialog(
                                                        title: Text(
                                                            "Edit name"),
                                                        content: SizedBox(
                                                          width: width - 150,
                                                          height: width - 100,
                                                          child: ListView(
                                                            children: [
                                                              TextField(
                                                                controller: nameController,
                                                                decoration: InputDecoration(
                                                                    hintText: "New name..."
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor: MaterialStateProperty
                                                                              .all(
                                                                              Colors.green
                                                                          )
                                                                      ),
                                                                      onPressed: () async{
                                                                        Map<dynamic, dynamic>? resultMapRegisterUser =
                                                                        await ServerHandler().updateUser(
                                                                            name: nameController.text,
                                                                          password: password,
                                                                          surname: surname,
                                                                          user_id: user_id
                                                                        );
                                                                        print("User was added");
                                                                        if (resultMapRegisterUser!['success'] == 1){
                                                                          print("USER REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          Navigator.pop(context);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                        else {
                                                                          print("USER NOT REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                        "Save",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .bold
                                                                        ),
                                                                      )
                                                                  ),
                                                                  IconButton(
                                                                      onPressed: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      icon: Icon(Icons.cancel_outlined, color: Colors.green,)
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
                                            icon: Icon(Icons.edit, color: Colors.lightGreen,))
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width/6,
                            child: FittedBox(
                              child: Text(
                                "Surname ",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width/6*5-74,
                                      child:  FutureBuilder(
                                          future: getData(),
                                          builder: (context, snapshot) {
                                            if(snapshot.connectionState == ConnectionState.waiting){
                                              return Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[800],
                                                    fontStyle: FontStyle.italic
                                                ),
                                              );
                                            }else{
                                              return Text(
                                                surname,
                                                style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[800],
                                                    fontStyle: FontStyle.italic
                                                ),
                                              );
                                            }
                                          }
                                      ),
                                    ),
                                    Expanded(
                                        child: IconButton(
                                            onPressed: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return GestureDetector(
                                                      onTap: (){
                                                        FocusScopeNode currentScope = FocusScope.of(context);

                                                        if (!currentScope.hasPrimaryFocus) {
                                                          currentScope.unfocus();
                                                        }
                                                      },
                                                      child: AlertDialog(
                                                        title: Text(
                                                            "Edit surname"),
                                                        content: SizedBox(
                                                          width: width - 150,
                                                          height: width - 100,
                                                          child: ListView(
                                                            children: [
                                                              TextField(
                                                                controller: surnameController,
                                                                decoration: InputDecoration(
                                                                    hintText: "New surname..."
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor: MaterialStateProperty
                                                                              .all(
                                                                              Colors.lightGreen
                                                                          )
                                                                      ),
                                                                      onPressed: () async{
                                                                        Map<dynamic, dynamic>? resultMapRegisterUser =
                                                                        await ServerHandler().updateUser(
                                                                            name: name,
                                                                            password: password,
                                                                            surname: surnameController.text,
                                                                            user_id: user_id
                                                                        );
                                                                        print("User was added");
                                                                        if (resultMapRegisterUser!['success'] == 1){
                                                                          print("USER REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          Navigator.pop(context);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                        else {
                                                                          print("USER NOT REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                        "Save",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .bold
                                                                        ),
                                                                      )
                                                                  ),
                                                                  IconButton(
                                                                      onPressed: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      icon: Icon(Icons.cancel_outlined, color: Colors.lightGreen,)
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
                                            icon: Icon(Icons.edit, color: Colors.lightGreen,)
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width/6,
                            child: FittedBox(
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: height * 0.025,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width/6*5-74,
                                      child:  FutureBuilder(
                                          future: getData(),
                                          builder: (context, snapshot) {
                                            if(snapshot.connectionState == ConnectionState.waiting){
                                              return Text(
                                                "",
                                                style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[800],
                                                    fontStyle: FontStyle.italic
                                                ),
                                              );
                                            }else{
                                              return Text(
                                                password,
                                                style: TextStyle(
                                                    fontSize: height * 0.02,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[800],
                                                    fontStyle: FontStyle.italic
                                                ),
                                              );
                                            }
                                          }
                                      ),
                                    ),
                                    Expanded(
                                        child: IconButton(
                                            onPressed: ()async{
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return GestureDetector(
                                                      onTap: (){
                                                        FocusScopeNode currentScope = FocusScope.of(context);

                                                        if (!currentScope.hasPrimaryFocus) {
                                                          currentScope.unfocus();
                                                        }
                                                      },
                                                      child: AlertDialog(
                                                        title: Text(
                                                            "Edit password"),
                                                        content: SizedBox(
                                                          width: width - 150,
                                                          height: width - 100,
                                                          child: ListView(
                                                            children: [
                                                              TextField(
                                                                controller: nameController,
                                                                decoration: InputDecoration(
                                                                    hintText: "New password..."
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          backgroundColor: MaterialStateProperty
                                                                              .all(
                                                                              Colors.lightGreen
                                                                          )
                                                                      ),
                                                                      onPressed: () async{
                                                                        Map<dynamic, dynamic>? resultMapRegisterUser =
                                                                        await ServerHandler().updateUser(
                                                                            name: name,
                                                                            password: passwordController.text,
                                                                            surname: surname,
                                                                            user_id: user_id
                                                                        );
                                                                        print("User was added");
                                                                        if (resultMapRegisterUser!['success'] == 1){
                                                                          print("USER REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          Navigator.pop(context);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                        else {
                                                                          print("USER NOT REGISTERED");
                                                                          print(resultMapRegisterUser['message']);
                                                                          setState(() {

                                                                          });
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                        "Save",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .bold
                                                                        ),
                                                                      )
                                                                  ),
                                                                  IconButton(
                                                                      onPressed: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      icon: Icon(Icons.cancel_outlined, color: Colors.lightGreen,)
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                              );
                                            },
                                            icon: Icon(Icons.edit, color: Colors.lightGreen,)
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8,)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.lightGreen,),
                onPressed: (){
                  print("logout");
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.green,),
                onPressed: ()async{
                  Map<dynamic, dynamic>? resultMapRegisterUser =
                      await ServerHandler().deleteUser(
                      email: email,
                      user_id: user_id
                  );
                  if (resultMapRegisterUser!['success'] == 1){
                    print("USER DELETED");
                    print(resultMapRegisterUser['message']);
                    Navigator.pop(context);
                    setState(() {

                    });
                  }
                  else {
                    print("USER NOT DELETED");
                    print(resultMapRegisterUser['message']);
                    setState(() {

                    });
                  }
                  print("deleted");
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}