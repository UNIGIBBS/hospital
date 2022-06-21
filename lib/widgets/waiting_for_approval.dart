import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingForApproval extends StatelessWidget {
  const WaitingForApproval({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      elevation: 5,
      child: Row(
        children: [
          SizedBox(
            width: width/4*3-4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "12/03/2022 - 13:30",
                    style: TextStyle(
                        fontSize: height*0.02,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Reason of visit:",
                    style: TextStyle(
                      fontSize: height*0.022,
                      color: Color(0xffef767a),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Pain In the throat and having an injury in his knee",
                    style: TextStyle(
                        fontSize: height*0.019,
                        color: Color(0xff333232),
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/4-4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: width*0.1-2,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: width*0.1-5,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: width*0.1-8,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage("https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}