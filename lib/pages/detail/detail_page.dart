import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/pages/detail/widgets/box_office.dart';
import 'package:flutter_movie_reservation_app/pages/detail/widgets/movie_category.dart';
import 'package:flutter_movie_reservation_app/pages/detail/widgets/sponsor.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(  // 쓸어서 내리면 이전페이지로 감(뒤로가기 버튼 없어서 추가함) -> 잘안됨. 나중에 수정
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta != null && details.primaryDelta! > 20) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            Hero(
              tag: 'movie-poster',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 560,
                  child: Image.network(
                    'https://picsum.photos/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '영화 제목',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '개봉일',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Text(
                    '태그라인',
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '러닝타임',
                    style: TextStyle(fontSize: 14),
                  ),
                  detailDivider(),
                  MovieCategory(),
                  detailDivider(),
                  Text(
                    '영화 설명',
                    style: TextStyle(fontSize: 13),
                  ),
                  detailDivider(),
                  SizedBox(height: 10),
                  Text(
                    '흥행정보',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  BoxOffice(),
                  SizedBox(height: 20),
                  Sponsor(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class detailDivider extends StatelessWidget {
  const detailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: Colors.grey[850],
    );
  }
}
