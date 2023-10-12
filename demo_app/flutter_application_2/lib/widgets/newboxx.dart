import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants.dart';
import 'package:flutter_application_2/onemoviepage.dart';
import 'package:flutter_application_2/widgets/favicon.dart';
import 'package:flutter_application_2/widgets/starbar.dart';

class NewBoxx extends StatelessWidget {
  const NewBoxx({super.key, required this.snapshot, required this.ctg});

  final AsyncSnapshot snapshot;
  final String ctg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: SizedBox(
          // color: Colors.amber,
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            // physics: ,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OneMoviePage(
                                  title: '${snapshot.data[index].title}',
                                  poster_path:
                                      '${snapshot.data[index].poster_path}',
                                  overview: '${snapshot.data[index].overview}',
                                  rating: snapshot.data[index].ratings,
                                  r_count: snapshot.data[index].ratings_count,
                                )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 155,
                          width: 105,
                          // color: Colors.blue,
                          child: Stack(alignment: Alignment.center, children: [
                            Positioned(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                  fit: BoxFit.contain,
                                  filterQuality: FilterQuality.high,
                                  '${Constants.img_path}${snapshot.data[index].poster_path}'),
                            )),
                            const Positioned(
                                top: 7,
                                right: 7,
                                child: favIcon(
                                  size: 22,
                                )),
                            // Positioned(
                            //   top: 6,
                            //   right: 5,
                            //   child: Image.asset(
                            //     'fav.jpg',
                            //     scale: 24,
                            //   ),
                            // ),
                            Positioned(
                                top: 65,
                                left: 4,
                                child: Container(
                                  height: 80,
                                  width: 95,
                                  // color: Colors.amber,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Text 1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.grey,
                                                  blurRadius: 12,
                                                  offset: Offset(3, 3))
                                            ]),
                                      ),
                                      Flexible(
                                          child: Container(
                                        child: Text(
                                          '${snapshot.data[index].title}',
                                          // softWrap: true,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              height: 1.2,
                                              shadows: [
                                                Shadow(
                                                    color: Colors.grey,
                                                    blurRadius: 12,
                                                    offset: Offset(3, 3))
                                              ]),
                                        ),
                                      )),
                                    ],
                                  ),
                                )),
                          ])),
                      SizedBox(
                          height: 30,
                          width: 100,
                          // padding: const EdgeInsets.only(left: 2, top: 4),
                          // color: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              SizedBox(
                                height: 12,
                                width: 100,
                                // color: Colors.amber,
                                child: Text('${snapshot.data[index].title}',
                                    softWrap: true,
                                    style: TextStyle(fontSize: 10)),
                              ),
                              const Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  StarRating(
                                    color: Colors.amber,
                                    size: 16.0,
                                    rating_no: snapshot.data[index].ratings,
                                  ),
                                  Text(
                                    "  ${snapshot.data[index].ratings}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
