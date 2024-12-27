


import 'package:flutter_movie_reservation_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_response_dto.dart';

abstract interface class MovieDataSource {

  Future<List<MovieResponseDto>> fetchNowPlayMovies();

  Future<List<MovieResponseDto>> fetchPopularMovies();

  Future<List<MovieResponseDto>> fetchTopRatedMovies();

  Future<List<MovieResponseDto>> fetchUpcomingMovies();

  Future<List<MovieDetailDto>> fetchMovieDetail(int id); 
}