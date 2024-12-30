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
