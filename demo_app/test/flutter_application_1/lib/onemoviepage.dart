import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/tmdb.dart';
import 'package:flutter_application_1/models/moviemodl.dart';
import 'package:flutter_application_1/widgets/constants.dart';

class OneMoviePage extends StatefulWidget {
  const OneMoviePage({
    super.key,
    required this.indexe,
    required this.ctg,
  });

  // final String namefilter;
  final int indexe;
  final String ctg;

  @override
  State<OneMoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<OneMoviePage> {
  // late Future<List<Movie>> trendingMovies;
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
    // print(widget.indexe);
    return Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 36,
                // ),
                FutureBuilder(
                    future: CtgMovie,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text("No Image"));
                      } else if (snapshot.hasData) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    SizedBox(
                                      // color: Colors.amber,
                                      height: 450,
                                      width: double.infinity,
                                      child: Image.network(
                                        '${Constants.img_path}'
                                        '${snapshot.data![widget.indexe].poster}',
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      top: 40,
                                      left: 10,
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('<',
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    )
                                  ]),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              snapshot
                                                  .data![widget.indexe].title,
                                              style: TextStyle(fontSize: 36)),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                                'Released: '
                                                '${snapshot.data![widget.indexe].releasedate}',
                                                style: const TextStyle(
                                                    fontSize: 14)),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            'Rating: ${snapshot.data![widget.indexe].rating}'
                                            ' '
                                            '('
                                            '${snapshot.data![widget.indexe].reviews}'
                                            ')',
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                              snapshot.data![widget.indexe]
                                                  .overview,
                                              style: const TextStyle(
                                                  fontSize: 14)),
                                        ]),
                                  )
                                ]));
                      } else {
                        return const Center(
                          child: LinearProgressIndicator(),
                        );
                      }
                    }),
              ],
            )));
  }
}
