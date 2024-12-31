class MovieDetailDto {
  final List<Genre> genres;
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
  final List<ProductionCompany> productionCompanies;

  MovieDetailDto({
    required this.genres,
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
    required this.productionCompanies,
  });

  MovieDetailDto.fromJson(Map<String, dynamic> map)
      : this(
          genres: (map['genres'] as List)
              .map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList(),
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
          budget: map['budget'] ?? 0,
          revenue: map['revenue'] ?? 0,
          productionCompanies: (map['production_companies'] as List)
              .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

  Map<String, dynamic> toJson() {
    return {
      'genres': genres.map((e) => e.toJson()).toList(),
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
      'budget': budget,
      'revenue': revenue,
      "production_companies":
          productionCompanies.map((e) => e.toJson()).toList(),
    };
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'] ?? 0,
          name: map['name'] ?? '',
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          logoPath: map['logo_path'],
          name: map['name'],
          originCountry: map['origin_country'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "logo_path": logoPath,
      "name": name,
      "origin_country": originCountry,
    };
  }
}
