import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import '../providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {
    final movieRepository = ref.watch(movieRepositoryProvider);
    return MovieMapNotifier(getMovie: movieRepository.getMovieById);
  },
);

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(movieId) async {
    if (state[movieId] != null) return;
    print('realizando peticion http');
    final movie = await getMovie(movieId);

    state = {
      ...state,
      movieId: movie,
    };
  }
}