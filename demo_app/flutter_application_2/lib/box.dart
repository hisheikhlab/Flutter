import 'package:flutter/material.dart';
import 'package:flutter_application_2/pagemovie.dart';

class Boxx extends StatelessWidget {
  final int crosscount;
  final Axis scrolldirec;
  final double hgt;

  const Boxx({
    super.key,
    required this.crosscount,
    required this.scrolldirec,
    required this.hgt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          height: hgt,
          // color: Colors.black26,
          child: GridView.count(
            crossAxisCount: crosscount,
            childAspectRatio: 1.7,
            scrollDirection: scrolldirec,
            children: [
              Container(
                margin: EdgeInsets.all(6.0),
                //color: Colors.amber,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                          height: 150,
                          width: 110,
                          color: Colors.black,
                          child: Center(
                            child: Stack(children: [
                              Positioned.fill(
                                  child: Image.network(
                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                                // height: 280,
                                // width: 187,
                                fit: BoxFit.cover,
                              )),
                              Positioned(
                                top: 08,
                                right: 5,
                                child: Image.asset(
                                  'fav.jpg',
                                  scale: 24,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text 1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 75,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 08,
                                  right: 10,
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 08),
                                  )),
                            ]),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => moviepage()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 15,
                          width: 110,
                          // //color: Colors.amber,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Movie Name",
                                  style: TextStyle(fontSize: 10)))),
                    ),
                    Container(
                        height: 15,
                        width: 110,
                        // color: Colors.black,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ratings",
                              style: TextStyle(fontSize: 10),
                            ))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                // color: Colors.amber,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                          height: 150,
                          width: 110,
                          color: Colors.black,
                          child: Center(
                            child: Stack(children: [
                              Positioned.fill(
                                  child: Image.network(
                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                                // height: 280,
                                // width: 187,
                                fit: BoxFit.cover,
                              )),
                              Positioned(
                                top: 08,
                                right: 5,
                                child: Image.asset(
                                  'fav.jpg',
                                  scale: 24,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text 1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 75,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 08,
                                  right: 10,
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 08),
                                  )),
                            ]),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 15,
                        width: 110,
                        // //color: Colors.amber,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Movie Name",
                                style: TextStyle(fontSize: 10)))),
                    Container(
                        height: 15,
                        width: 110,
                        // color: Colors.black,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ratings",
                              style: TextStyle(fontSize: 10),
                            ))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                // //color: Colors.amber,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                          height: 150,
                          width: 110,
                          color: Colors.black,
                          child: Center(
                            child: Stack(children: [
                              Positioned.fill(
                                  child: Image.network(
                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                                // height: 280,
                                // width: 187,
                                fit: BoxFit.cover,
                              )),
                              Positioned(
                                top: 08,
                                right: 5,
                                child: Image.asset(
                                  'fav.jpg',
                                  scale: 24,
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 60,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text 1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: 75,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Text2',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 08,
                                  right: 10,
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 08),
                                  )),
                            ]),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 15,
                        width: 110,
                        // //color: Colors.amber,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Movie Name",
                                style: TextStyle(fontSize: 10)))),
                    Container(
                        height: 15,
                        width: 110,
                        // color: Colors.black,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ratings",
                              style: TextStyle(fontSize: 10),
                            ))),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                color: Colors.blue,
              )
            ],
          ),
        ));
  }
}
