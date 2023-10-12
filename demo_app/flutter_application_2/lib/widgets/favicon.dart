import 'package:flutter/material.dart';

class favIcon extends StatefulWidget {
  const favIcon({super.key, required this.size});

  final double size;

  @override
  State<favIcon> createState() => _favIconState();
}

class _favIconState extends State<favIcon> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: widget.size,
          shadows: const [
            Shadow(color: Colors.grey, blurRadius: 40, offset: Offset(2, 2))
          ],
        ));
  }
}
