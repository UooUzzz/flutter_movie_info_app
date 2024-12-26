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
        Container(
          child: Text(title),
        ),
        SizedBox(
          height: 180, // 리스트뷰 높이 180 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(imageUrl[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
