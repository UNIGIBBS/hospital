import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/doctor_profile_page.dart';

class SectionWidget extends StatefulWidget {
  SectionWidget({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {

  var colorsCheck = false;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorProfilePage(data:widget.data)));
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              SizedBox(width: 8,),
              SizedBox(
                width: width/3-8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: CircleAvatar(
                    radius: width*0.15-2,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: width*0.15-6,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: width*0.15-10,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage("https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width/3*2-24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "${widget.data["name"]} ${widget.data["surname"]}",
                      style: TextStyle(
                          fontSize: height*0.025,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${widget.data["department"]}",
                      style: TextStyle(
                          fontSize: height*0.02,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500]
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
