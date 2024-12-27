import 'package:dio/dio.dart';
import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_response_dto.dart';

class MovieRemoteDataSourceImpl implements MovieDataSource {
  // dio 사용
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) => true,
    baseUrl: 'https://api.themoviedb.org/3/movie/',
  ));

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchNowPlayMovies() {
    // TODO: implement fetchNowPlayMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}
