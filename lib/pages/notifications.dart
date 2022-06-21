import 'package:flutter/material.dart';
import 'package:hospital/models/appointment_model.dart';
import 'package:intl/intl.dart';



class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {

  List<Appointment> items = [
    Appointment("Beyza", "Beyza", "Allergy", "assets/images/user(3).png", "Accepted", "10/10/2020 \n10.10"),
    Appointment("Buket", "Buket", "Dermatology", "assets/images/user(6).png", "Accepted", "10/10/2020 \n 10.30 ")

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(

            borderRadius:  BorderRadius.only(

                bottomRight: Radius.circular(70),

                bottomLeft: Radius.circular(70))

        ),
        elevation: 14,
        backgroundColor:Colors.blueGrey,
        toolbarHeight: 80,
        centerTitle: true,
        title: Text("Notifications", style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          final item = items[index];
          return ListTile(
            trailing: Text('${item.date!} \n ${item.situation!}'),
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(item.image),
            ),
            title: Text('${item.name!} ${item.surname!}', style: TextStyle(color: Colors.black),),
            subtitle: Text('${item.department!}' ),
          );
        },

      ),
    );
  }


}