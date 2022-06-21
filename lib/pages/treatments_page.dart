import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/past_appointment_widget.dart';
import '../widgets/upcoming_appointment_widget.dart';
import '../widgets/waiting_for_approval.dart';

class TreatmentsPage extends StatefulWidget {
  const TreatmentsPage({Key? key}) : super(key: key);

  @override
  State<TreatmentsPage> createState() => _TreatmentsPageState();
}

class _TreatmentsPageState extends State<TreatmentsPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Your treatments",
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
            child: Text(
              "Upcoming appointments",
              style: TextStyle(
                  fontSize: height*0.02,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          UpcomingAppointmentWidget(),
          Divider(
            thickness: 3,
            color: Colors.grey[300],
            endIndent: 20,
            indent:20
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Waiting for approval",
              style: TextStyle(
                  fontSize: height*0.02,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          WaitingForApproval(),
          Divider(
              thickness: 3,
              color: Colors.grey[300],
              endIndent: 20,
              indent:20
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Previous appointments",
              style: TextStyle(
                  fontSize: height*0.02,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          PastAppointmentWidget()
        ],
      ),
    );
  }
}