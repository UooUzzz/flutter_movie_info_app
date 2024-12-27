

import 'package:flutter_movie_reservation_app/domain/entity/movie.dart';
import 'package:flutter_movie_reservation_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_reservation_app/domain/repository/movie_repository.dart';

class FetchMovieUsecase {
  FetchMovieUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>> executeNowPlaying() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }

  Future<List<Movie>> executePopular() async {
    return await _movieRepository.fetchPopularMovies();
  }

  Future<List<Movie>> executeTopRated() async {
    return await _movieRepository.fetchTopRatedMovies();
  }

  Future<List<Movie>> executeUpcoming() async {
    return await _movieRepository.fetchUpcomingMovies();
  }

  Future<List<MovieDetail>> executeDetail(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }
}