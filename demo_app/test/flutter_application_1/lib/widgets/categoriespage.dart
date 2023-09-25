import 'package:flutter/material.dart';
import 'package:flutter_application_1/onemoviepage.dart';
import 'package:flutter_application_1/widgets/constants.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    super.key,
    required this.snap,
    required this.xctg,
  });

  final AsyncSnapshot snap;
  final String xctg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      // width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 100 / 150),
          physics: BouncingScrollPhysics(),
          itemCount: 21,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
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
                      '${Constants.img_path}' '${snap.data[index].poster}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  )),
            );
          }),
    );
  }
}
