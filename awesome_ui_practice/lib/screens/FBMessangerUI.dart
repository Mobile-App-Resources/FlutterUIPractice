import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FBMessangerUIHomeScreen extends StatelessWidget {
  Widget getHeaderWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://scontent.fpnq2-1.fna.fbcdn.net/v/t31.0-8/21949782_1703850876354865_8746594292840452369_o.jpg?_nc_cat=109&_nc_sid=13bebb&_nc_ohc=iNQMHaSnzRIAX9GxmgN&_nc_ht=scontent.fpnq2-1.fna&oh=097c586899a011864fa690a6a8ca235d&oe=5F2F9C7E"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Chats",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Icon(Icons.camera_alt),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Icon(Icons.edit),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  height: 40,
                  width: 40,
                ),              ],
            )
          ],
        ),
      ),
      color: Colors.white,
      height: 70,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            getHeaderWidget(),
          ],
        ),
      ),
    );
  }
}
