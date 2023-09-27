import 'package:flutter/material.dart';
import 'package:flutter_application_1/moviepage.dart';

class sidedrawer extends StatelessWidget {
  const sidedrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Username',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MoviePage(ctg: 'Trending Movies')));
              },
              child: const Text('Trending',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MoviePage(ctg: 'Top Rated Movies')));
              },
              child: const Text('Top Rated',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MoviePage(ctg: 'Upcoming Movies')));
              },
              child: const Text('Upcoming',
                  style: TextStyle(fontSize: 20, color: Colors.white))),
          const SizedBox(
            height: 30,
          ),
          const Text('Favorites', style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 30,
          ),
          const Text('Watchlist', style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Logout', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
