import 'package:flutter/material.dart';
import 'screens/FBMessangerUI.dart';
import 'screens/PostsHomeScreen.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      color: Colors.teal,
    child: HomeController(),
//      child: FBMessangerUIHomeScreen(),
//      child: Center(
//        child: GridView.count(
//            crossAxisSpacing: 5,
//            mainAxisSpacing: 5,
//            crossAxisCount: 1,
//            childAspectRatio: 4,
//            shrinkWrap: true,
//            physics: NeverScrollableScrollPhysics(),
//            children: List.generate(1, (index) => (OptionsCard()))),
//      ),
    ));
  }
}

class OptionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
//          elevation: 3.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color(0xff1C1C2B),
            child: Column(
              children: <Widget>[
                Text(
                  "First UI layout",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )));
  }
}
