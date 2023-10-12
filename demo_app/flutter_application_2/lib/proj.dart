import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/tmdb.dart';
import 'package:flutter_application_2/searchpage.dart';
import 'package:flutter_application_2/widgets/drawerapp.dart';
import 'package:flutter_application_2/models/movieModel.dart';
import 'package:flutter_application_2/widgets/newboxx.dart';
import 'package:flutter_application_2/Categorypage.dart';

class MovieListings extends StatefulWidget {
  const MovieListings({
    super.key,
  });

  @override
  State<MovieListings> createState() => _MovieListingsState();
}

class _MovieListingsState extends State<MovieListings> {
  late Future<List<moviesModel>> popularMovies;
  late Future<List<moviesModel>> topratedMovies;
  late Future<List<moviesModel>> upcomingMovies;
  @override
  void initState() {
    super.initState();
    popularMovies = Api().get_popular();
    topratedMovies = Api().get_toprated();
    upcomingMovies = Api().get_upcoming();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const Drawer(
          child: MyDrawer(),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.amber,
        // ),
        body: SingleChildScrollView(
            child: Column(children: [
          //top bar
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                // Spacer(),
                IconButton(
                  onPressed: () {
                    // Scaffold.of(context).openDrawer();
                  },
                  icon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => searchPage()));
                    },
                    child: Image.asset(
                      'search_icon.jpg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          // title
          const Padding(
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
            padding: const EdgeInsets.only(left: 30, right: 20, top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular  _____",
                  textScaleFactor: 1.2,
                ),
                // Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cate_page(
                                    ftre: popularMovies,
                                    ctg: 'Popular Movies',
                                  )));
                    },
                    child: const Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          FutureBuilder(
              future: popularMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return NewBoxx(
                    ctg: 'popular',
                    snapshot: snapshot,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          //Second box
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Rated  _____",
                  textScaleFactor: 1.2,
                ),
                // Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cate_page(
                                    ftre: topratedMovies,
                                    ctg: 'Top rated Movies',
                                  )));
                    },
                    child: const Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          FutureBuilder(
              future: topratedMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return NewBoxx(
                    ctg: 'top rated',
                    snapshot: snapshot,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          //Third box
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20, top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Upcoming  _____",
                  textScaleFactor: 1.2,
                ),
                // Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cate_page(
                                    ftre: upcomingMovies,
                                    ctg: 'Upcoming Movies',
                                  )));
                    },
                    child: const Text(
                      "See all >",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
          //box grid
          FutureBuilder(
              future: upcomingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return NewBoxx(
                    ctg: 'upcoming',
                    snapshot: snapshot,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
            child: Align(
                alignment: Alignment.center, child: Text("Created by XXX")),
          ),
        ])),
      ),
    );
  }
}
