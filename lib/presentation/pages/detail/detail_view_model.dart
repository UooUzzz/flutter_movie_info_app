import 'package:flutter_movie_reservation_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_reservation_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태클래스
// 영화 상세페이지 리스트 List<MovieDetail>

class DetailViewModel extends Notifier<List<MovieDetail>> {
  @override
  List<MovieDetail> build() {
    return [];
  }

  Future<void> fetchMovieDetail(int id) async {
    try {
      final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
      final result = await fetchMovieUsecase.executeDetail(id);
      if (result.isEmpty) {
        throw Exception('데이터 로드 실패!');
      }
      state = result;
    } catch (e) {
      print('$e');
      rethrow;
    }
  }
}

final detailViewModelProvider =
    NotifierProvider<DetailViewModel, List<MovieDetail>>(() {
  return DetailViewModel();
});
