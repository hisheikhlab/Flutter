import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/tmdb.dart';
import 'package:flutter_application_1/models/moviemodl.dart';
import 'package:flutter_application_1/moviepage.dart';
import 'package:flutter_application_1/widgets/carous.dart';
import 'package:flutter_application_1/widgets/movieslistscroll.dart';
import 'package:flutter_application_1/widgets/sidemenu.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topratedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().gettrending();
    topratedMovies = Api().gettoprated();
    upcomingMovies = Api().getupcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FLUTFLIX',
          style: TextStyle(fontSize: 36, color: Colors.red[700]),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: sidedrawer(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviePage(
                                ctg: 'Trending Movies',
                              )));
                },
                child: Text(
                  "Trending Movies",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                  child: FutureBuilder(
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text("No Image"));
                        } else if (snapshot.hasData) {
                          return Carousel(
                            snap: snapshot,
                            xctg: 'Trending Movies',
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })),
              SizedBox(height: 32),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoviePage(
                                  ctg: 'Top Rated Movies',
                                )));
                  },
                  child: Text(
                    "Top Rated Movies",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )),
              SizedBox(height: 16),
              SizedBox(
                  child: FutureBuilder(
                      future: topratedMovies,
                      builder: (context, snapshot2) {
                        if (snapshot2.hasError) {
                          return Center(child: Text("${snapshot2.error}"));
                        } else if (snapshot2.hasData) {
                          return Movielist(
                            snap: snapshot2,
                            xctg: 'Top Rated Movies',
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })),
              SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoviePage(
                                ctg: 'Upcoming Movies',
                              )));
                },
                child: Text(
                  "Upcoming Movies",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                  child: FutureBuilder(
                      future: upcomingMovies,
                      builder: (context, snapshot3) {
                        if (snapshot3.hasError) {
                          return Center(child: Text("${snapshot3.error}"));
                        } else if (snapshot3.hasData) {
                          return Movielist(
                            snap: snapshot3,
                            xctg: 'Upcoming Movies',
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
