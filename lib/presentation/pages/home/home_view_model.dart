import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태클래스
// 영화 리스트 List<Movie>

class HomeViewModel extends Notifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> fetchNowPlayingMovies() async {
    final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
    final result = await fetchMovieUsecase.executeNowPlaying();
    state = result;
  }

  Future<void> fetchPopularMovies() async {
    final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
    final result = await fetchMovieUsecase.executePopular();
    state = result;
  }

  Future<void> fetchTopRatedMovies() async {
    final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
    final result = await fetchMovieUsecase.executeTopRated();
    state = result;
  }

  Future<void> fetchUpcomingMovies() async {
    final fetchMovieUsecase = ref.read(fetchMovieUsecaseProvider);
    final result = await fetchMovieUsecase.executeUpcoming();
    state = result;
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Movie>>(
  () {
    return HomeViewModel();
  }
);