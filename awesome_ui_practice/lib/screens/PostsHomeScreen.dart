import 'package:flutter/material.dart';
import '../Themes/Colors.dart';
import '../Constants/data.dart';

class HomeController extends StatelessWidget {
  Widget getHeaderAvatar() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/30/28/4a/30284a7eafb27bb208e466738611c420.jpg"),
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget getCreateYourStoryWidget() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        1.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: [Color_Grad1, Color_Grad2], // whitish to gray
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              height: 55,
              width: 55,
            ),
            Text("Your Story "),
          ],
        ));
  }

  Widget getASignleStoryForData(Map userstory) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: <Widget>[
                userstory['story']
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(userstory['img'].toString()),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color_Header, width: 3),
                        ),
                      )
                    : Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(userstory['img'].toString()),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        height: 55,
                        width: 55,
                      ),
                userstory['online']
                    ? Positioned(
                        top: 35,
                        left: 40,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(2, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      )
              ],
            ),
            Text(userstory['name'].toString()),
          ],
        ));
  }

  Widget getRecentStoriesScroll() {
    return Container(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  getCreateYourStoryWidget(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          userStories.length,
                          (index) =>
                              getASignleStoryForData(userStories[index]))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getListOfPosts() {
    return Column(
        children: List.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 420,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                          Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            NetworkImage('https://images.unsplash.com/photo-1536763843054-126cc2d9d3b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  height: 35,
                                  width: 35,
                                ),
                                SizedBox(width:10),
                                Text('Full Name', style: TextStyle(color: Colors.black),)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  iconSize: 30,
                                  onPressed: (){
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.rectangle,
                              image: DecorationImage(image: NetworkImage('https://images4.alphacoders.com/565/thumb-1920-565042.jpg'), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset:
                                  Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.hearing,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                  },
                                ),
                                Text('143', style: TextStyle(color:  Colors.black),),
                                SizedBox(width: 10,),
                                IconButton(
                                  icon: Icon(
                                    Icons.mode_comment,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                  },
                                ),
                                Text('143', style: TextStyle(color:  Colors.black),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.supervisor_account,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: getHeaderAvatar(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: (){

            },
          )
        ],
      ),

      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          getRecentStoriesScroll(),
          getListOfPosts(),
        ],
      )),
//    body: Container(
//      height: 80,
//      child: Padding(
//        padding: const EdgeInsets.all(10.0),
//        child: Row(
//          children: <Widget>[
//          ],
//        ),
//      ),
//    ),
    );
  }
}
