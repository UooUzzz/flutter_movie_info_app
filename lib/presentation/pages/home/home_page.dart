import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/widgets/popular_list.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/widgets/post_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataList = ref.watch(homeViewModelProvider);

    // 데이터가 없는 경우 예외처리!
    if (dataList.nowPlaying.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Scaffold(
        body: SafeArea(
          // 위에만 safeArea주기
          top: true,
          left: false,
          right: false,
          bottom: false,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Text(
                '가장 인기있는',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: GestureDetector(
                    onTap: () {
                      final movie = dataList.nowPlaying[0];
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(
                            movieId: movie.id,
                            posterPath: movie.posterPath,
                          );
                        },
                      ));
                    },
                    child: Hero(
                      tag: 'movie-poster-${dataList.nowPlaying[0].id}',
                      child: Container(
                        child: Image.network(
                          '$imageBaseUrl${dataList.nowPlaying[0].posterPath}',
                          fit: BoxFit.fitWidth, // 가로를 꽉채우고 세로는 원래 비율에 맞게 커짐!
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              PostList(
                title: '현재 상영중',
                imageUrl: dataList.nowPlaying,
              ),
              SizedBox(height: 18),
              PopularList(dataList.popular),
              PostList(
                title: '평점 높은순',
                imageUrl: dataList.topRated,
              ),
              PostList(
                title: '개봉 예정',
                imageUrl: dataList.upcoming,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
