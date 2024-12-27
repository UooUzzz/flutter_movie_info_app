class MovieDetailDto {
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

  MovieDetailDto({
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

  MovieDetailDto.fromJson(Map<String, dynamic> map)
      : this(
          genreIds: map['genre_ids'],
          id: map['id'],
          originalTitle: map['original_title'],
          overview: map['overview'],
          popularity: map['popularity'],
          posterPath: map['poster_path'],
          releaseDate: map['release_date'],
          title: map['title'],
          voteAverage: map['vote_average'],
          voteCount: map['vote_count'],
        );
  
  Map<String, dynamic> toJson() {
    return {
      'genre_ids': genreIds,
      'id': id,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
