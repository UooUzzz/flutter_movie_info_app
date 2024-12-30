class MovieResponseDto {
  final int id;
  final double popularity;
  final String posterPath;


  MovieResponseDto({
    required this.id,
    required this.popularity,
    required this.posterPath,
  });

  MovieResponseDto.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'] ?? 0,
          popularity: map['popularity'] ?? 0.0,
          posterPath: map['poster_path'] ?? '',
          
        );
        
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'popularity': popularity,
      'poster_path': posterPath,
    };
  }
}
