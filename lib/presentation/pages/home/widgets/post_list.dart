import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final String title;
  final List<String> imageUrl;

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
        SizedBox(
          height: 180, // 리스트뷰 높이 180
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index > 0) SizedBox(width: 8), // 첫번째 이미지빼고 간격주기
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
