import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/local_storage_repository.dart';
import '../providers.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  DocumentSnapshot? lastDocument;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(
        limit: 20, startAfter: lastDocument);

    if (movies.isNotEmpty) {
      lastDocument = movies.last
          .docSnapshot; // Necesitarás ajustar tu modelo Movie para almacenar el snapshot del documento.
    }

    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id!] = movie;
    }

    state = {...state, ...tempMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id!: movie};
    }
  }
}
