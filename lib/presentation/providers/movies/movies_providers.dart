import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';
import 'movies_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>(
  (ref) {
    final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
    return MoviesNotifier(
      fetchMoreMovies: fetchMoreMovies,
    );
  },
);

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isloading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isloading) return;

    isloading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    await Future.delayed(const Duration(milliseconds: 100));

    isloading = false;
  }
}
