import 'package:flutter/material.dart';

class MovieCategory extends StatelessWidget {
  final List<String> genres;

  const MovieCategory({
    required this.genres,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: genres.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                genres[index],
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
