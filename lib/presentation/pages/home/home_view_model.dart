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

  Future<void> fetchNowPlayingMovies() async {
    state = await fetchMovieUsecase.executeNowPlaying();
  }

  Future<void> fetchPopularMovies() async {
    state = await fetchMovieUsecase.executePopular();
  }

  Future<void> fetchTopRatedMovies() async {
    state = await fetchMovieUsecase.executeTopRated();
  }

  Future<void> fetchUpcomingMovies() async {
    state = await fetchMovieUsecase.executeUpcoming();
  }
}

// class NowPlayingViewModel extends Notifier<List<Movie>> {
//   @override
//   List<Movie> build() => [];

//   Future<void> fetchNowPlayingMovies() async {
//     final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
//     final result = await fetchMovieUsecase.executeNowPlaying();
//     state = result;
//   }
// }

// class PopularViewModel extends Notifier<List<Movie>> {
//   @override
//   List<Movie> build() => [];

//   Future<void> fetchPopulargMovies() async {
//     final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
//     final result = await fetchMovieUsecase.executePopular();
//     state = result;
//   }
// }

// class TopRatedViewModel extends Notifier<List<Movie>> {
//   @override
//   List<Movie> build() => [];

//   Future<void> fetchTopRatedMovies() async {
//     final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
//     final result = await fetchMovieUsecase.executeTopRated();
//     state = result;
//   }
// }

// class UpcomingViewModel extends Notifier<List<Movie>> {
//   @override
//   List<Movie> build() => [];

//   Future<void> fetchUpcomingMovies() async {
//     final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
//     final result = await fetchMovieUsecase.executeUpcoming();
//     state = result;
//   }
// }

// final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Movie>>(() {
//   return HomeViewModel();
// });

// 카테고리별 뷰모델 공급자
final nowPlayingViewModelProvider =
    NotifierProvider<NowPlayingViewModel, List<Movie>>(() {
  return NowPlayingViewModel();
});

final popularViewModelProvider =
    NotifierProvider<PopularViewModel, List<Movie>>(() {
  return PopularViewModel();
});

final topRatedViewModelProvider =
    NotifierProvider<TopRatedViewModel, List<Movie>>(() {
  return TopRatedViewModel();
});

final upcomingViewModelProvider =
    NotifierProvider<UpcomingViewModel, List<Movie>>(() {
  return UpcomingViewModel();
});
