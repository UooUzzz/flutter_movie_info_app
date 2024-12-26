import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/pages/home/widgets/post_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 이미지 리스트
    final List<String> imageUrl = List.generate(
      20,
      (index) => 'https://picsum.photos/200/300',
    );

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
                  child: Container(
                    height: 500,
                    child: Image.network(
                      'https://picsum.photos/200/300',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              PostList(
                title: '현재 상영중',
                imageUrl: imageUrl,
              ),
              PostList(
                title: '평점 높은순',
                imageUrl: imageUrl,
              ),
              PostList(
                title: '개봉 예정',
                imageUrl: imageUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
