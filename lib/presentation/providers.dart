import 'package:flutter_movie_reservation_app/data/data_source/movie_data_source.dart';
import 'package:flutter_movie_reservation_app/data/data_source/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_reservation_app/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_reservation_app/domain/repository/movie_repository.dart';
import 'package:flutter_movie_reservation_app/domain/usecase/fetch_movie_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewModel에서 직접 객체 생성하지 않을 수 있게
// UseCase 공급해주는 Provider 생성
// ViewModel 내에서는 Provider에 의해서 UseCase 공급받을거!

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieRemoteDataSourceImpl();
});

final _movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final dataSource = ref.read(_movieDataSourceProvider);
    return MovieRepositoryImpl(dataSource);
  },
);

final fetchMovieUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchMovieUsecase(movieRepo);
});
