import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_response_dto.dart';

class MovieRemoteDataSourceImpl implements MovieDataSource {
  // dio 사용
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) => true,
    baseUrl: 'https://api.themoviedb.org/3/movie/',
  ));

  // API 키 .env 갖고오기
  final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

  // MovieRemoteDataSourceImpl();

  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        '$id',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieDetailDto.fromJson(data);
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponseDto?> fetchNowPlayMovies() async {
    try {
      final response = await _dio.get(
        'now_playing',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieResponseDto.fromJson(data);
      } else {
        throw Exception('Failed to load now playing movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    try {
      final response = await _dio.get(
        'popular',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieResponseDto.fromJson(data);
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(
        'top_rated',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieResponseDto.fromJson(data);
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    try {
      final response = await _dio.get(
        'upcoming',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return MovieResponseDto.fromJson(data);
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      rethrow;
    }
  }
}
