import 'package:flutter/material.dart';
import 'package:flutter_application_2/box.dart';
import 'package:flutter_application_2/drawerapp.dart';
import 'package:flutter_application_2/page2.dart';

class MovieListings extends StatefulWidget {
  const MovieListings({super.key});

  @override
  State<MovieListings> createState() => _MovieListingsState();
}

class _MovieListingsState extends State<MovieListings> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: MyDrawer(),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.amber,
        // ),
        body: SingleChildScrollView(
            child: Column(children: [
          //top bar
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Image.asset(
                    'ham.jpg',
                    height: 20,
                    width: 20,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    // Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset(
                    'search_icon.jpg',
                    height: 20,
                    width: 20,
                  ),
                )
              ],
            ),
          ),
          // title
          Padding(
              padding: EdgeInsets.only(left: 30, right: 20, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Movies",
                  textScaleFactor: 2.0,
                ),
              )),
          //First box
          //boxbar
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 35),
            child: Row(
              children: [
                Text(
                  "Popular  _____",
                  textScaleFactor: 1.2,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageSec()));
                    },
                    child: Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          Boxx(
            hgt: 200,
            crosscount: 1,
            scrolldirec: Axis.horizontal,
          ),
          //Second box
          //boxbar
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Actor  _____",
                  textScaleFactor: 1.2,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          Boxx(
            hgt: 200,
            crosscount: 1,
            scrolldirec: Axis.horizontal,
          ),
          //Third box
          //boxbar
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 20),
            child: Row(
              children: [
                Text(
                  "Director  _____",
                  textScaleFactor: 1.2,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          Boxx(
            hgt: 200,
            crosscount: 1,
            scrolldirec: Axis.horizontal,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            child: Align(
                alignment: Alignment.center, child: Text("Created by XXX")),
          ),
        ])),
      ),
    );
  }
}
