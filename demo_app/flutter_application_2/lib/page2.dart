import 'package:flutter/material.dart';
import 'package:flutter_application_2/box%20copy.dart';

class pageSec extends StatefulWidget {
  const pageSec({super.key});

  @override
  State<pageSec> createState() => _pagesecondState();
}

class _pagesecondState extends State<pageSec> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 20, top: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Popular Movies",
                    style: TextStyle(fontSize: 28),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go back",
                        style: TextStyle(color: Colors.blueGrey),
                      )),
                ],
              ),
            ),
            Boxx2(hgt: 9000, crosscount: 3, scrolldirec: Axis.vertical),
          ],
        ),
      ),
    ));
  }
}
