import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  final List<String> imageUrl;

  PopularList(this.imageUrl);

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
        popularPosts(imageUrl: imageUrl),
      ],
    );
  }
}

class popularPosts extends StatelessWidget {
  const popularPosts({
    super.key,
    required this.imageUrl,
  });

  final List<String> imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
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
                        imageUrl[index],
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
  }
}
