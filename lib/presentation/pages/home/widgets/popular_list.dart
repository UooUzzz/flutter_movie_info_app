import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';

class PopularList extends StatelessWidget {
  final Future<List<Movie>> Function() imageUrlP;

  PopularList(this.imageUrlP);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '인기순',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        popularPosts(imageUrlP: imageUrlP),
      ],
    );
  }
}

class popularPosts extends StatelessWidget {
  const popularPosts({
    super.key,
    required this.imageUrlP,
  });

  final Future<List<Movie>> Function() imageUrlP;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: imageUrlP(),
      builder: (context, snapshot) {
        print('스냅샤샷샤샤샤');
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('이미지 로드 실패'));
        }
        final imageUrls = snapshot.data!;
        return SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              print(imageUrls);
              final movie = imageUrls[index];
              final imageUrl = 'https://image.tmdb.org/t/p/w500/${movie.posterPath}';
              return Container(
                width: 150,
                height: 180,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 180,
                      color: Colors.transparent,
                    ),
                    Positioned(
                      right: 0,
                      child: SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        height: 100,
                        child: Text(
                          (index + 1).toString(), // 순서대로 랭킹 출력
                          style: TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
