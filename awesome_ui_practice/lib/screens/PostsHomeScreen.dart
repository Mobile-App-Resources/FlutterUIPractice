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
                    end: Alignment(1.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: [Color_Grad1 , Color_Grad2], // whitish to gray
                    tileMode: TileMode.repeated, // repeats the gradient over the canvas
                  ),
                ),
                child: Icon(Icons.add),
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
                userstory['story'] ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                userstory['img'].toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                ) : Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                userstory['img'].toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  height: 55,
                  width: 55,
                ),
                userstory['online'] ? Positioned(
                  top: 35,
                  left: 40,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                ): SizedBox(height: 1,)
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
                      children: List.generate(userStories.length, (index) => getASignleStoryForData(userStories[index]))
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_Primary,
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color_Header,
        leading: getHeaderAvatar(),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),

      body: getRecentStoriesScroll(),
    );
  }
}
