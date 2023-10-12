import 'package:flutter/material.dart';
import 'package:flutter_application_2/api/tmdb.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/movieModel.dart';
import 'package:flutter_application_2/onemoviepage.dart';
// import 'package:flutter_application_2/trash/pagemovie.dart';

class cate_page extends StatefulWidget {
  const cate_page({super.key, required this.ctg, required this.ftre});

  final String ctg;
  final Future<List<moviesModel>> ftre;

  @override
  State<cate_page> createState() => _cate_pageState();
}

class _cate_pageState extends State<cate_page> {
  late Future<List<moviesModel>> popularMovies;
  late Future<List<moviesModel>> topratedMovies;
  late Future<List<moviesModel>> upcomingMovies;

  int page_no = 1;
  int i = 0;
  @override
  void initState() {
    super.initState();
    popularMovies = Api().get_popular();
    topratedMovies = Api().get_toprated();
    upcomingMovies = Api().get_upcoming();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.ctg,
                  style: TextStyle(fontSize: 28),
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Go back",
                      style: TextStyle(color: Colors.blueGrey),
                    )),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          //   child: Container(
          //       // width: d/,
          //       height: MediaQuery.of(context).size.height,
          //       // color: Colors.amber,
          //       child: FutureBuilder(
          //           future: widget.ftre,
          //           builder: (context, snapshot) {
          //             if (snapshot.hasError) {
          //               return Center(
          //                 child: Text('${snapshot.error}'),
          //               );
          //             } else if (snapshot.hasData) {
          //               return GridView.builder(
          //                   gridDelegate:
          //                       const SliverGridDelegateWithFixedCrossAxisCount(
          //                           crossAxisCount: 3,
          //                           childAspectRatio: 100 / 150),
          //                   itemCount: snapshot.data?.length,
          //                   itemBuilder: (context, index) {
          //                     return Padding(
          //                       padding: EdgeInsets.all(6),
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(8.0),
          //                         child: GestureDetector(
          //                           onTap: () {
          //                             Navigator.push(
          //                                 context,
          //                                 MaterialPageRoute(
          //                                     builder: (context) => OneMoviePage(
          //                                         title:
          //                                             '${snapshot.data?[index].title}',
          //                                         poster_path:
          //                                             '${snapshot.data?[index].poster_path}',
          //                                         overview:
          //                                             '${snapshot.data?[index].overview}',
          //                                         rating: snapshot
          //                                             .data![index].ratings,
          //                                         r_count: snapshot
          //                                             .data![index]
          //                                             .ratings_count)));
          //                           },
          //                           child: Image.network(
          //                               fit: BoxFit.fill,
          //                               '${Constants.img_path}'
          //                               '${snapshot.data?[index].poster_path}'),
          //                         ),
          //                       ),
          //                     );
          //                   });
          //             } else {
          //               return Center(
          //                 child: CircularProgressIndicator(),
          //               );
          //             }
          //           })),
          // ),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: FutureBuilder(
                  future: widget.ftre,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        children: [
                          Container(
                            // color: Colors.grey,
                            height: MediaQuery.of(context).size.height - 200,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 100 / 150),
                                itemCount: 12,
                                // physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => OneMoviePage(
                                                      title:
                                                          '${snapshot.data?[i + index].title}',
                                                      poster_path:
                                                          '${snapshot.data?[i + index].poster_path}',
                                                      overview:
                                                          '${snapshot.data?[i + index].overview}',
                                                      rating: snapshot
                                                          .data![i + index]
                                                          .ratings,
                                                      r_count: snapshot
                                                          .data![i + index]
                                                          .ratings_count)));
                                        },
                                        child: Image.network(
                                            fit: BoxFit.fill,
                                            '${Constants.img_path}'
                                            '${snapshot.data?[i + index].poster_path}'),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: page_no > 1,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: TextButton(
                                      onPressed: () {
                                        if (page_no > 1) {
                                          setState(() {
                                            page_no--;
                                            i = i - 12;
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "<",
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      )),
                                ),
                                Text(
                                  "Page $page_no",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                Visibility(
                                  visible: snapshot.data!.length > i + 24,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: TextButton(
                                      onPressed: () {
                                        if (snapshot.data!.length > i + 24) {
                                          setState(() {
                                            page_no++;
                                            i = i + 12;
                                          });
                                        }
                                      },
                                      child: const Text(
                                        ">",
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Visibility(
          //         visible: page_no > 1,
          //         child: TextButton(
          //             onPressed: () {
          //               if (page_no > 1) {
          //                 setState(() {
          //                   page_no--;
          //                   i = i - 12;
          //                 });
          //               }
          //             },
          //             child: Text(
          //               "<",
          //               style: TextStyle(color: Colors.blueGrey),
          //             )),
          //       ),
          //       Text(
          //         "Page $page_no",
          //         style: TextStyle(color: Colors.blueGrey),
          //       ),
          //       TextButton(
          //           onPressed: () {
          //             setState(() {
          //               page_no++;
          //               i = i + 12;
          //             });
          //           },
          //           child: Text(
          //             ">",
          //             style: TextStyle(color: Colors.blueGrey),
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    ));
  }
}
