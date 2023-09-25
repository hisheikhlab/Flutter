import 'package:flutter/material.dart';
import 'package:flutter_application_1/onemoviepage.dart';
import 'package:flutter_application_1/widgets/constants.dart';

class Movielist extends StatelessWidget {
  const Movielist({
    super.key,
    required this.snap,
    required this.xctg,
  });

  final AsyncSnapshot snap;
  final String xctg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          itemCount: snap.data.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      // color: Colors.amber,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OneMoviePage(
                                        ctg: xctg,
                                        indexe: index,
                                      )));
                        },
                        child: Image.network(
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            '${Constants.img_path}'
                            '${snap.data[index].poster}'),
                      ),
                      //   Image.network(
                      //       fit: BoxFit.cover,
                      //       filterQuality: FilterQuality.high,
                      //       '${Constants.img_path}' '${snap.data[index].poster}'),
                      // ),
                    )));
          }),
    );
  }
}
