import 'package:flutter/material.dart';

class moviepage extends StatefulWidget {
  const moviepage({super.key});

  @override
  State<moviepage> createState() => _moviepageState();
}

class _moviepageState extends State<moviepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 20, top: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Name of the Movie",
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
          Padding(
              padding: EdgeInsets.only(left: 30, right: 20, top: 35),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    child: Text("123"),
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
