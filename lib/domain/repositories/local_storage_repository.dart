import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_movie_flutter_app/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Movie movie);

  Future<bool> isMovieFavorite(int movieId);

  Future<List<Movie>> loadMovies(
      {int limit = 10, DocumentSnapshot? startAfter});
}
