import 'dart:convert';

import 'package:flutter_movie_reservation_app/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MovieResponseDto : fromJson test', () {
    const sampleJsonString = """
    {
      "id": 1241982,
      "popularity": 2811.069,
      "poster_path": "/2WVvPcVRqfjyVzIUVIcszGb6zT4.jpg"
    }
""";

  final map = jsonDecode(sampleJsonString);
  final movieResponseDto = MovieResponseDto.fromJson(map);
  expect(movieResponseDto.id, 1241982);
  expect(movieResponseDto.popularity, 2811.069);
  expect(movieResponseDto.posterPath, "/2WVvPcVRqfjyVzIUVIcszGb6zT4.jpg");
  });
}
