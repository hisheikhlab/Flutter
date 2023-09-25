import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          Container(
              height: 70,
              // color: Colors.amber,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Spacer(),
                    Image.asset(
                      'user.jpg',
                      height: 35,
                      width: 35,
                    ),
                    Spacer(),
                    Text(
                      "  Username",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Divider(
            height: 8,
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text(
              "Favourites",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text(
              "Watchlist",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text(
              "New Releases",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text(
              "Upcoming",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            // padding: EdgeInsets.only(left: 50),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text(
              "Reviewed",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 8.0,
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Log Out",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ]);
  }
}
