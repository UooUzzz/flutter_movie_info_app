import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/domain/usecase/fetch_movie_usecase.dart';
import 'package:flutter_movie_reservation_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태클래스
// 영화 리스트 List<Movie>

// 카테고리 별로 뷰모델 생성

class HomeViewModel extends Notifier<List<Movie>> {
  final FetchMovieUsecase fetchMovieUsecase;

  HomeViewModel(this.fetchMovieUsecase);

  @override
  List<Movie> build() => [];

  Future<List<Movie>> fetchNowPlayingMovies() async {
    try {
      final nowPlaying = await fetchMovieUsecase.executeNowPlaying();
      state = nowPlaying;
      return nowPlaying;
    } catch (e) {
      print('$e');
      return [];
    }
  }

  Future<List<Movie>> fetchPopularMovies() async {
    try {
      final popular = await fetchMovieUsecase.executePopular();
      print('에러에러에ㅓㄹ');
      print(popular);
      state = popular;
      return popular;
    } catch (e) {
      print('$e');
      return [];
    }
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    try {
      final topRated = await fetchMovieUsecase.executeTopRated();
      state = topRated;
      return topRated;
    } catch (e) {
      print('$e');
      return [];
    }
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    try {
      final upcoming = await fetchMovieUsecase.executeUpcoming();
      state = upcoming;
      return upcoming;
    } catch (e) {
      print('$e');
      return [];
    }
  }
}

final homeViewModelProvider = Provider<HomeViewModel>((ref) {
  final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
  return HomeViewModel(fetchMovieUsecase);
});  // HomeViewModel 관리 Provider. 객체 생성은 Providers에서


