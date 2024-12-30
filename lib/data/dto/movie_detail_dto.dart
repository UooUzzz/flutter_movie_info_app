class MovieDetailDto {
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;
  final int runtime;

  MovieDetailDto({
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.runtime,
  });

  MovieDetailDto.fromJson(Map<String, dynamic> map)
      : this(
          genreIds: map['genre_ids'] ?? [],
          id: map['id'] ?? 0,
          originalTitle: map['original_title'] ?? '',
          overview: map['overview'] ?? '',
          popularity: map['popularity'] ?? 0.0,
          posterPath: map['poster_path'] ?? '',
          releaseDate: map['release_date'] != null 
              ? DateTime.tryParse(map['release_date']) // Json -> DateTime
              : null,
          title: map['title'] ?? '',
          voteAverage: map['vote_average'] ?? 0.0,
          voteCount: map['vote_count'] ?? 0,
          runtime: map['runtime'] ?? 0,
        );

  Map<String, dynamic> toJson() {
    return {
      'genre_ids': genreIds,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate?.toIso8601String(), // DateTime -> String
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'runtime': runtime,
    };
  }
}
