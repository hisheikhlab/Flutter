import 'package:flutter/material.dart';

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 30, right: 20, top: 35),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Search',
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
      TextField(
        decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            icon: Icon(Icons.search)),
      )
    ]))));
  }
}
