import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  DoctorProfilePage({Key? key, required this.data}) : super(key: key);
  var data;

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      Positioned(
                        left: 30,
                        bottom: -width*0.14+2,
                        child: CircleAvatar(
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: width*0.14+2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text(
                    "${widget.data["name"]} ${widget.data["surname"]}",
                    style: TextStyle(
                        fontSize: height*0.02,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, width/5, 0),
                    child: Text(
                      "${widget.data["appellation"].toUpperCase()} - ${widget.data["department"].toUpperCase()}",
                      style: TextStyle(
                          fontSize: height*0.017,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Education: ",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]
                          ),
                        ),
                        TextSpan(
                          text: "Abdullah Gul University",
                          style: TextStyle(
                              fontSize: height*0.02,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800]
                          ),
                        ),
                      ]
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
                  child: Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: height*0.025,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(Icons.mail, color: Colors.grey[800],),
                      ),
                      SizedBox(width: 16,),
                      SizedBox(
                        width: width-52,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Mail: ",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800]
                                  ),
                                ),
                                TextSpan(
                                  text: " ${widget.data["email"]}",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500]
                                  ),
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Icon(Icons.phone, color: Colors.grey[800],),
                      ),
                      SizedBox(width: 16,),
                      SizedBox(
                        width: width-52,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Phone number: ",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[800]
                                  ),
                                ),
                                TextSpan(
                                  text: "0111 111 11 11",
                                  style: TextStyle(
                                      fontSize: height*0.02,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[500]
                                  ),
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
