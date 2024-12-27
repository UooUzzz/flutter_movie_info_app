class MovieResponseDto {
  final int id;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  MovieResponseDto({
    required this.id,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieResponseDto.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          popularity: map['popularity'],
          posterPath: map['posterPath'],
          voteAverage: map['voteAverage'],
          voteCount: map['voteCount'],
        );
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'popularity': popularity,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
