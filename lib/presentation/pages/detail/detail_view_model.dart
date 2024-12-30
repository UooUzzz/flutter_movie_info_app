import 'package:flutter_movie_reservation_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_reservation_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태클래스
// 영화 상세페이지 리스트 List<MovieDetail>

class DetailViewModel extends Notifier<List<MovieDetail>> {
  Map<int, String> _genreMap = {};
  bool _isGenreLoaded = false;

  @override
  List<MovieDetail> build() {
    return [];
  }

  Future<void> fetchGenreData(int id) async {
    try {
      final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
      final genreMap = await fetchMovieUsecase.executeGenreMap(id);
      if (genreMap.isNotEmpty) {
        _genreMap = genreMap;
        _isGenreLoaded = true; // 데이터 로드 완료
        state = state; // 상태 업데이트!
      }
    } catch (e) {
      print('$e');
      rethrow;
    }
  }

  bool get isGenreLoaded => _isGenreLoaded;
  Map<int, String> get genreMap => _genreMap;

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
