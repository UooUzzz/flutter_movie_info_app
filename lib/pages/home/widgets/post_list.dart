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
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imageUrl[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
