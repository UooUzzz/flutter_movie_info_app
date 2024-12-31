class MovieDetail {
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
  final int budget;
  final int revenue;

  MovieDetail({
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
    required this.budget,
    required this.revenue,
  });
}
