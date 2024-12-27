import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_reservation_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayMovies();
    return result
        ?.map(
          (e) => Movie(
            id: e.id,
            popularity: e.popularity,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }
}
