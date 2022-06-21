import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/pages/notifications.dart';
import 'package:hospital/pages/take_appointment_page.dart';
import 'package:hospital/pages/treatments_page.dart';
import 'package:hospital/pages/user_profile_page.dart';
import 'package:hospital/providers/user_info.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print(Provider.of<UserInfo>(context).mail);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: width*0.07+5,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: width*0.07+2,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: width*0.07-1,
                              child: Icon(CupertinoIcons.person, color: Colors.grey,),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: SizedBox(
                          width: width-width*0.24-58,
                          child: Text(
                            "Sumer mahallesi, Kayseri, Kocasinan",
                            style: TextStyle(
                                fontSize: height*0.02,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: width*0.1,
                          child: FittedBox(
                            child: IconButton(
                              icon: Icon(CupertinoIcons.bell_fill, color: Colors.black,),
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ProfileList()),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TreatmentsPage()));
                    },
                    child: Container(
                      width: width*4/5,
                      height: width/2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.9), BlendMode.dstATop),
                          image: const AssetImage("assets/images/appointments.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[800]!, blurRadius: 5)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Previous\ntreatments",
                          style: TextStyle(
                              fontSize: height*0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/5-16,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "C",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "U",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "R",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "E",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width/5-16,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "D",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "R",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "U",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "G",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "S",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width*4/5,
                    height: width/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.9), BlendMode.dstATop),
                            image: const AssetImage("assets/images/drugs.jpg"),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[800]!, blurRadius: 5)
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Previous\nprescriptions",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: height*0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TakeAppointmentPage()));
                    },
                    child: Container(
                      width: width*4/5,
                      height: width/2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.9), BlendMode.dstATop),
                              image: const AssetImage("assets/images/doctor.jpg"),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.grey[800]!, blurRadius: 5)
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Take\nappointment",
                          style: TextStyle(
                              fontSize: height*0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/5-16,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "M",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "E",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "D",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "I",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "C",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width/5-16,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "V",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "I",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "S",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "I",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "T",
                            style: TextStyle(
                                fontSize: height*0.025,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width*4/5,
                    height: width/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.9), BlendMode.dstATop),
                            image: const AssetImage("assets/images/contact.jpg"),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[800]!, blurRadius: 5)
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Contact\ninformation",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: height*0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
