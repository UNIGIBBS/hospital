import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comment_widget.dart';

class PastAppointmentWidget extends StatefulWidget {
  const PastAppointmentWidget({Key? key}) : super(key: key);

  @override
  State<PastAppointmentWidget> createState() => _PastAppointmentWidgetState();
}

class _PastAppointmentWidgetState extends State<PastAppointmentWidget> {

  var commentController = TextEditingController();

  var value = 2;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      elevation: 5,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width/4*3-4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "12/03/2022",
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
                          color: Color(0xff333232),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "13:30",
                      style: TextStyle(
                          fontSize: height*0.02,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),
                    ),

                    Container(
                      height: 15,
                      width: width/4-40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green
                      ),
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(CupertinoIcons.doc_richtext, color: Colors.grey,size: width*0.1,)
                    )
                  ],
                ),
              ),
            ],
          ),
          value == 1 ? Column(
            children: [
              Divider(thickness: 3,indent: 10,endIndent: 10,),
              SizedBox(height: 10,),
              CommentWidget(comment: "I am a comment",),
              CommentWidget(comment: "I am a comment",),
              CommentWidget(comment: "I am a comment",),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 12, 12),
                child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: "Comment...",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () async{

                      },
                    ),
                  ),
                ),
              )
            ],
          ) : Container(),
          Center(
            child: IconButton(
              icon: Icon(value ==1 ? CupertinoIcons.chevron_up :CupertinoIcons.chevron_down),
              onPressed: (){
                if(value == 1){
                  setState((){
                    value = 2;
                    print(2);
                  });
                }else if(value == 2){
                  setState((){
                    value = 1;
                    print(1);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

