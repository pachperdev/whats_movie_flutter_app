import '../../domain/datasources/movies_datasource.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }
}
