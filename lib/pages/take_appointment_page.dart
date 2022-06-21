import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/widgets/section_widget.dart';
import 'package:provider/provider.dart';

import '../providers/user_info.dart';
import '../services/server_handler.dart';

class TakeAppointmentPage extends StatefulWidget {
  const TakeAppointmentPage({Key? key}) : super(key: key);

  @override
  State<TakeAppointmentPage> createState() => _TakeAppointmentPageState();
}

class _TakeAppointmentPageState extends State<TakeAppointmentPage> {

  var name;
  var surname;
  var password;
  var user_id;
  var email;

  Map<dynamic, dynamic>? resultMapRegisterUser;
  List? data;

  getData()async{
    resultMapRegisterUser =
    await ServerHandler().getAllDoctors();
    print("User was added");
    print(resultMapRegisterUser);
    if (resultMapRegisterUser!['success'] == 1){
      print("USER REGISTERED");
      data = resultMapRegisterUser!['get_patient_info'];
      print(resultMapRegisterUser);
    }
    else {
      print("USER NOT REGISTERED");
      data = [];
      print(resultMapRegisterUser!['get_patient_info']);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Take appointment",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search for doctors",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 10)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent, style: BorderStyle.none, width: 10)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, style: BorderStyle.none, width: 10)
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getData(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return CircularProgressIndicator();
                }else{
                  print(data?.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.length,
                    itemBuilder: (context, index){
                      print(index);
                      return SectionWidget(data: data?[index]);
                    }
                  );
                }
          }),
        ],
      ),
    );
  }
}
