import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/widgets/favicon.dart';
import 'package:flutter_application_2/widgets/starbar.dart';

class OneMoviePage extends StatelessWidget {
  const OneMoviePage(
      {super.key,
      required this.title,
      required this.poster_path,
      required this.overview,
      required this.rating,
      required this.r_count});

  final String title;
  final String poster_path;
  final String overview;
  final double rating;
  final int r_count;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 25, right: 25, top: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Go back",
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      )),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  // color: Colors.amber,
                                  child: Text(
                                    softWrap: true,
                                    title,
                                    style: TextStyle(fontSize: 28),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    height: 400,
                                    width: double.infinity,
                                    color: Colors.amber,
                                    child: Stack(children: [
                                      Positioned.fill(
                                        child: Image.network(
                                          fit: BoxFit.fitWidth,
                                          '${Constants.img_path}'
                                          '${poster_path}',
                                        ),
                                      ),
                                      const Positioned(
                                          top: 12,
                                          right: 12,
                                          child: favIcon(
                                            size: 36,
                                          ))
                                    ]),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    StarRating(
                                      color: Colors.amber,
                                      size: 22,
                                      rating_no: rating,
                                    ),
                                    Text(
                                      "  $rating ($r_count)",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Description: $overview",
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ]))
                    ]))));
  }
}
