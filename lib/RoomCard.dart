import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  String roomName;
  int deviceCount;
  String urlImg;
  Color bgColor;

  RoomCard({this.roomName, this.deviceCount, this.urlImg, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      padding: EdgeInsets.all(30),
      child:
        Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Text(
                urlImg,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              roomName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$deviceCount devices",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),

    );
  }
}
