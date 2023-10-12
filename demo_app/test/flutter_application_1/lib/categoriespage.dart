import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/tmdb.dart';
import 'package:flutter_application_1/models/moviemodl.dart';
import 'package:flutter_application_1/widgets/categoriespage.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.ctg});

  final String ctg;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  // ignore: non_constant_identifier_names
  late Future<List<Movie>> CtgMovie;
  @override
  void initState() {
    super.initState();
    if (widget.ctg == 'Trending Movies') {
      CtgMovie = Api().gettrending();
    } else if (widget.ctg == 'Top Rated Movies') {
      CtgMovie = Api().gettoprated();
    } else {
      CtgMovie = Api().getupcoming();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:
                              Text('<', style: TextStyle(color: Colors.white))),
                      Text(
                        widget.ctg,
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FutureBuilder(
                      future: CtgMovie,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text("No Image"));
                        } else if (snapshot.hasData) {
                          return MoviesPage(
                            snap: snapshot,
                            xctg: widget.ctg,
                          );
                        } else {
                          return const Center(
                            child: RefreshProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            )));
  }
}
