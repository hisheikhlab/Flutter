import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/models/movieModel.dart';

class cate_page_w extends StatelessWidget {
  const cate_page_w({super.key, required this.ftre});

  final Future<List<moviesModel>> ftre;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Container(
          // width: d/,
          height: 800,
          color: Colors.amber,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            child: FutureBuilder(
                future: ftre,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // width: 50,
                            height: 200,
                            color: Colors.blue,
                            child: Image.network('${Constants.img_path}'
                                '${snapshot.data?[index].poster_path}'),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }

                // GridView.builder(
                //     gridDelegate:
                //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                //     itemCount: snap.data.length,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         // width: 50,
                //         height: 200,
                //         color: Colors.blue,
                //         child: Image.network('${Constants.img_path}'
                //             '${snapshot.data[index].poster_path}'),
                //       );
                //     }),
                ),
          ),
        ));
  }
}
