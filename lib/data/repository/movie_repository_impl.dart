import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_reservation_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);

  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayMovies();
    return result
        .map(
          (e) => Movie(
            id: e.id,
            popularity: e.popularity,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    return result
        .map(
          (e) => Movie(
            id: e.id,
            popularity: e.popularity,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    return result
        .map(
          (e) => Movie(
            id: e.id,
            popularity: e.popularity,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    return result
        .map(
          (e) => Movie(
            id: e.id,
            popularity: e.popularity,
            posterPath: e.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<MovieDetail>> fetchMovieDetail(int id) async {
    final result = await _movieDataSource.fetchMovieDetail(id);
    return result
        .map(
          (e) => MovieDetail(
            genreIds: e.genreIds,
            id: e.id,
            originalTitle: e.originalTitle,
            overview: e.overview,
            popularity: e.popularity,
            posterPath: e.posterPath,
            releaseDate: e.releaseDate,
            title: e.title,
            voteAverage: e.voteAverage,
            voteCount: e.voteCount,
          ),
        )
        .toList();
  }
}
