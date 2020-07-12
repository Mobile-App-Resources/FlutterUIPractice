import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FBMessangerUIHomeScreen extends StatelessWidget {
  TextEditingController _searchController = new TextEditingController();

  Widget getCreateYourStoryWidget() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Icon(Icons.add),
              ),
              height: 75,
              width: 75,
            ),
            Text("Your Story "),
          ],
        ));
  }

  Widget getASignleStoryForData() {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/originals/30/28/4a/30284a7eafb27bb208e466738611c420.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                  ),
                ),
                Positioned(
                  top: 48,
                  left: 52,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                )
              ],
            ),
            Text("Deepika "),
          ],
        ));
  }

  Widget getHeaderWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                              "https://i.pinimg.com/originals/30/28/4a/30284a7eafb27bb208e466738611c420.jpg"),
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
                  width: 10,
                ),
                Container(
                  child: Icon(Icons.edit),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  height: 40,
                  width: 40,
                ),
              ],
            )
          ],
        ),
      ),
      color: Colors.white,
      height: 70,
    );
  }

  Widget getSearchController() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            cursorColor: Colors.black26,
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
                hintText: "Search",
                border: InputBorder.none),
          ),
        ),
        height: 45,
      ),
    );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  getCreateYourStoryWidget(),
                  getASignleStoryForData(),
                  getASignleStoryForData(),
                  getASignleStoryForData(),
                  getASignleStoryForData(),
                  getASignleStoryForData(),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            getHeaderWidget(),
            getSearchController(),
            getRecentStoriesScroll(),
          ],
        ),
      ),
    );
  }
}
