import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/data.dart';
// Need to change the conditional online/offline, has story etc

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
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
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
      height: 60,
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

  Widget getListOfChats() {
    return Column(
        children: List.generate(
            userMessages.length,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              userMessages[index]['story'] ?Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              userMessages[index]['img'].toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.blue, width: 3),
                                ),
                              ): Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              userMessages[index]['img'].toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                height: 55,
                                width: 55,
                              ),
                              userMessages[index]['online']? Positioned(
                                top: 35,
                                left: 40,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 3)),
                                ),
                              ) : SizedBox(height: 1,)
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userMessages[index]['name'].toString(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    userMessages[index]['message'].toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    userMessages[index]['created_at'].toString(),
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              getHeaderWidget(),
              getSearchController(),
              getRecentStoriesScroll(),
              getListOfChats(),
            ],
          ),
        ),
      ),
    );
  }
}
