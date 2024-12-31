import 'package:flutter/material.dart';

class BoxOffice extends StatelessWidget {
  final double voteAverage; // 평점
  final int voteCount; // 평점투표수
  final double popularity; // 인기점수
  final int budget; // 예산
  final int revenue; // 수익

  const BoxOffice({
    super.key,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.budget,
    required this.revenue,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Box(value: voteAverage.toStringAsFixed(3), label: '평점'),
          SizedBox(width: 7),
          Box(value: voteCount.toString(), label: '평점투표수'),
          SizedBox(width: 7),
          Box(value: popularity.toStringAsFixed(3), label: '인기점수'),
          SizedBox(width: 7),
          Box(value: budget.toString(), label: '예산'),
          SizedBox(width: 7),
          Box(value: revenue.toString(), label: '수익'),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String value;
  final String label;
  
  const Box({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 70), // 텍스트 따라 박스너비 달라지게 최소너비설정!
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white,
          width: 0.3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 텍스트 길이 따라 박스크기 달라짐!
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 13),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
