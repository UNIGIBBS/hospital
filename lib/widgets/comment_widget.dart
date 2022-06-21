import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  CommentWidget({Key? key, required this.comment}) : super(key: key);

  var comment;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();

}

class _CommentWidgetState extends State<CommentWidget> {

  var userName = "User Userov";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: width*0.07+1,
                backgroundColor: Colors.green,
                child: Center(
                  child: CircleAvatar(
                    radius: width*0.07-2,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: CircleAvatar(
                        radius: width*0.07-4,
                        backgroundColor: Colors.grey[100],
                        child: Center(
                          child: Icon(Icons.person, size: height*0.03, color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Container(
                    width: width-48-width*0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${userName}\n",
                                  style: TextStyle(
                                      fontSize: height*0.015,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              TextSpan(
                                  text: "${widget.comment}",
                                  style: TextStyle(
                                    fontSize: height*0.015,
                                    color: Colors.black,
                                  )
                              ),
                            ]
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
          Divider(
            thickness: 3,
            color: Colors.grey[300],
            endIndent: 50,
            indent: 50,
          )
        ],
      ),
    );
  }
}