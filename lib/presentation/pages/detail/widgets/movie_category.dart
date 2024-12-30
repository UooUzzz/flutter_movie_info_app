import 'package:flutter/material.dart';

class MovieCategory extends StatelessWidget {
  final List<int> genreIds;
  final Map<int, String> genreMap;

  MovieCategory({
    required this.genreIds,
    required this.genreMap,
  });

  @override
  Widget build(BuildContext context) {
    if (genreIds.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: genreIds.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final genreId = genreIds[index];
          final genreName = genreMap[genreId] ?? 'UnKnown';

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
                genreName,
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
