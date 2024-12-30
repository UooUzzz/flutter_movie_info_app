import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/widgets/popular_list.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/home/widgets/post_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);

    // 영화 리스트 데이터 갖고오기
    // final Future<List<Movie>> nowPlaying =
    //     homeViewModel.fetchNowPlayingMovies();
    // final Future<List<Movie>> popular = homeViewModel.fetchPopularMovies();
    // final Future<List<Movie>> topRated = homeViewModel.fetchTopRatedMovies();
    // final Future<List<Movie>> upcoming = homeViewModel.fetchUpcomingMovies();

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
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailPage();
                        },
                      ));
                    },
                    child: Hero(
                      tag: 'movie-poster',
                      child: Container(
                        height: 500,
                        child: Image.network(
                          'https://picsum.photos/200/300',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              PostList(
                title: '현재 상영중',
                imageUrl: homeViewModel.fetchNowPlayingMovies(),
              ),
              SizedBox(height: 18),
              PopularList(homeViewModel.fetchPopularMovies),
              PostList(
                title: '평점 높은순',
                imageUrl: homeViewModel.fetchTopRatedMovies(),
              ),
              PostList(
                title: '개봉 예정',
                imageUrl: homeViewModel.fetchUpcomingMovies(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
