import 'package:flutter/material.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/detail_view_model.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/widgets/box_office.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/widgets/movie_category.dart';
import 'package:flutter_movie_reservation_app/presentation/pages/detail/widgets/sponsor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DetailPage extends ConsumerStatefulWidget {
  final int movieId; // 영화 고유번호(ID)
  final String posterPath; // 이미지 URL

  const DetailPage({
    required this.movieId,
    required this.posterPath,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  void initState() {
    super.initState();

    ref
        .read(detailViewModelProvider.notifier)
        .fetchMovieDetail(widget.movieId); // ID로 영화정보 가져오기
    // API요청시작, 상태 업데이트

    ref
        .read(detailViewModelProvider.notifier)
        .fetchGenreData(widget.movieId); // 장르 데이터 가져오기
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(detailViewModelProvider);
    // 상태 관찰, 변경 사항 -> UI업데이트

    final genreMap =
        ref.watch(detailViewModelProvider.notifier).genreMap; // 장르 데이터
    final isGenreLoaded =
        ref.watch(detailViewModelProvider.notifier).isGenreLoaded;

    final movieId = widget.movieId;
    final posterPath = widget.posterPath;

    if (movieDetail.isEmpty || genreMap.isEmpty || !isGenreLoaded) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final movie = movieDetail[0];
    const String imageBaseUrl =
        'https://image.tmdb.org/t/p/w500/'; // 홈페이지에서 디테일페이지로 전달이 안돼서 이렇게!

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: ListView(
          children: [
            Hero(
              tag: 'movie-poster-$movieId',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 570,
                  child: Image.network(
                    '$imageBaseUrl$posterPath',
                    fit: BoxFit.fitWidth, // 가로를 꽉채우고 세로는 원래 비율에 맞게 커짐!
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
                        movie.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        DateFormat('yyyy-MM-dd')
                            .format(movie.releaseDate!), // 시간빼고 날짜만 출력
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    movie.originalTitle, // 태그라인 없어서 original_title로 해줌!
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    '${movie.runtime.toString()}분',
                    style: TextStyle(fontSize: 14),
                  ),
                  detailDivider(),
                  // 장르 로딩되면 표시! 왜안돼...
                  isGenreLoaded
                      ? MovieCategory(
                          genreIds: movie.genreIds,
                          genreMap: genreMap,
                        )
                      : CircularProgressIndicator(),
                  detailDivider(),
                  // 띄어쓰기 단위로 줄바꿈을 해주고 싶은데 그렇게 되질 않음...
                  Text(
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    movie.overview,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.6,
                    ),
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
                  BoxOffice(
                    voteAverage: movie.voteAverage,
                    voteCount: movie.voteCount,
                    popularity: movie.popularity,
                    budget: movie.budget,
                    revenue: movie.revenue,
                  ),
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
