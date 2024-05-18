import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_movie_flutter_app/domain/entities/movie.dart';

import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies(
      {int limit = 10, DocumentSnapshot? startAfter}) {
    return datasource.loadMovies(limit: limit, startAfter: startAfter);
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}
