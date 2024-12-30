import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_reservation_app/data/dto/movie_response_dto.dart';

// 여기서 리스트로 바꾸고 results 경로 map해주기

class MovieRemoteDataSourceImpl implements MovieDataSource {
  // dio 사용
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) => true,
    baseUrl: 'https://api.themoviedb.org/3',
    headers: {
      'Authorization': 'Bearer ${dotenv.env['TMDB_API_KEY']}',
    },
  ));

  // final String _apiKey = dotenv.env['TMDB_API_KEY'] ?? '';

  // MovieRemoteDataSourceImpl();

  @override
  Future<List<MovieResponseDto>> fetchNowPlayMovies() async {
    try {
      final response = await _dio.get(
        '/movie/now_playing',
        queryParameters: {
          // 'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      print('!!!Now!!!');
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List? ?? [];
        return data
            .map((movieJson) => MovieResponseDto.fromJson(movieJson))
            .toList();
      } else {
        throw Exception(
            'Failed to load now playing movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchPopularMovies() async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {
          // 'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      print('!!!Popular!!!');
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List? ?? [];
        return data
            .map((movieJson) => MovieResponseDto.fromJson(movieJson))
            .toList();
      } else {
        throw Exception('Failed to load popular movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchTopRatedMovies() async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          // 'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      print('!!!Top!!!');
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List? ?? [];
        return data
            .map((movieJson) => MovieResponseDto.fromJson(movieJson))
            .toList();
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieResponseDto>> fetchUpcomingMovies() async {
    try {
      final response = await _dio.get(
        '/movie/upcoming',
        queryParameters: {
          // 'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      print('!!!Up!!!');
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data['results'] as List? ?? [];
        return data
            .map((movieJson) => MovieResponseDto.fromJson(movieJson))
            .toList();
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (e) {
      rethrow;
    }
  }

  // 위에 카테고리들이랑 다르게 상세페이지는 제이슨에서 results를 거치지 않음!
  // 형식도 다름!

  @override
  Future<List<MovieDetailDto>> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        '/movie/$id',
        queryParameters: {
          // 'api_key': _apiKey,
          'language': 'ko-KR',
        },
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return [MovieDetailDto.fromJson(data)]; // 리스트로 반환
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      rethrow;
    }
  }

  // 장르 Map 키값 밸류값 
  Future<Map<int, String>> fetchGenreMap(int id) async {
    final response = await _dio.get(
      '/movie/$id',
      queryParameters: {
        'language': 'ko-KR',
      },
    );
    if (response.statusCode == 200) {
      final genres = response.data['genres'] as List? ?? [];
      Map<int, String> genreMap = {};
      for (var genre in genres) {
        int id = genre['id'];
        String name = genre['name'];
        genreMap[id] = name;
      }
      return genreMap;
    } else {
      throw Exception('Failed to load genres');
    }
  }
}
