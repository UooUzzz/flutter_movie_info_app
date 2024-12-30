import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';

class PostList extends StatelessWidget {
  final String title;
  final Future<List<Movie>> imageUrl;

  PostList({
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        FutureBuilder<List<Movie>>(
          future: imageUrl,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(child: Text('이미지 로드 실패'));
            }
            final imageUrls = snapshot.data!;
            // print('Poster URLs: ${imageUrls.map((movie) => movie.posterPath).toList()}');
            return SizedBox(
              height: 180, // 리스트뷰 높이 180
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  final movie = imageUrls[index];
                  final posterPath = movie.posterPath.isNotEmpty
                      ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
                      : 'https://picsum.photos/200/300';
                  return Row(
                    children: [
                      if (index > 0) SizedBox(width: 8), // 첫번째 이미지빼고 간격주기
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          posterPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
