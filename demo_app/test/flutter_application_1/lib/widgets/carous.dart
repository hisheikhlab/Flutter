import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/onemoviepage.dart';
import 'package:flutter_application_1/widgets/constants.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.snap,
    required this.xctg,
  });

  final AsyncSnapshot snap;
  final String xctg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snap.data.length,
        options: CarouselOptions(
          height: 300,
          viewportFraction: 0.55,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
        itemBuilder: (BuildContext, itmindx, pgindx) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 195,
              // color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OneMoviePage(
                                ctg: xctg,
                                indexe: itmindx,
                              )));
                },
                child: Image.network(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    '${Constants.img_path}' '${snap.data[itmindx].poster}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
