import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/domain/usecase/fetch_movie_usecase.dart';
import 'package:flutter_movie_reservation_app/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 상태클래스
// 새로운 상태클래스 타입! DataList 클래스
class DataList {
  final List<Movie> nowPlaying;
  final List<Movie> popular;
  final List<Movie> topRated;
  final List<Movie> upcoming;

  DataList({
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upcoming = const [],
  });

  DataList copyWith({
    List<Movie>? nowPlaying,
    List<Movie>? popular,
    List<Movie>? topRated,
    List<Movie>? upcoming,
  }) {
    return DataList(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

// 2. 뷰모델
class HomeViewModel extends Notifier<DataList> {
  FetchMovieUsecase get fetchMovieUsecase => ref.read(fetchMovieUsecaseProvider);

  HomeViewModel();

  @override
  DataList build() {
    // 위젯트리가 완전히 빌드된 후에 비동기 작업!
    // WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchNowPlayingMovies();
      fetchPopularMovies();
      fetchTopRatedMovies();
      fetchUpcomingMovies();
    // });

    // return state; // 초기 상태 반환
    return DataList();
  }

  Future<void> fetchNowPlayingMovies() async {
    try {
      final nowPlaying = await fetchMovieUsecase.executeNowPlaying();
      state = state.copyWith(nowPlaying: nowPlaying);
    } catch (e) {
      print('$e');
    }
  }

  Future<void> fetchPopularMovies() async {
    try {
      final popular = await fetchMovieUsecase.executePopular();
      state = state.copyWith(popular: popular);
    } catch (e) {
      print('$e');
    }
  }

  Future<void> fetchTopRatedMovies() async {
    try {
      final topRated = await fetchMovieUsecase.executeTopRated();
      state = state.copyWith(topRated: topRated);
    } catch (e) {
      print('$e');
    }
  }

  Future<void> fetchUpcomingMovies() async {
    try {
      final upcoming = await fetchMovieUsecase.executeUpcoming();
      state = state.copyWith(upcoming: upcoming);
    } catch (e) {
      print('$e');
    }
  }

  // Getter
  List<Movie> get nowPlaying => state.nowPlaying;
  List<Movie> get popular => state.popular;
  List<Movie> get topRated => state.topRated;
  List<Movie> get upcoming => state.upcoming;
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, DataList>(() {
  return HomeViewModel();
});  


// HomeViewModel 관리 Provider. 객체 생성은 Providers에서


