class MovieResponseDto {
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieResponseDto({
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieResponseDto.fromJson(Map<String, dynamic> map)
      : this(
          genreIds: map['genreIds'],
          id: map['id'],
          originalTitle: map['originalTitle'],
          overview: map['overview'],
          popularity: map['popularity'],
          posterPath: map['posterPath'],
          releaseDate: map['releaseDate'],
          title: map['title'],
          voteAverage: map['voteAverage'],
          voteCount: map['voteCount'],
        );
  
  Map<String, dynamic> toJson() {
    return {
      'genreIds': genreIds,
      'id': id,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
      'title': title,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }
}
