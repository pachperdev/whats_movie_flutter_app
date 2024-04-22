import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';
import '../../delegates/search_movie_delegate.dart';
import '../../providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_filter_outlined,
                color: colors.primary,
              ),
              const SizedBox(width: 5),
              Text('WhatsMovie', style: titleStyle),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  final searchedMovies = ref.read(searchMoviesProvider);
                  final searcQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searcQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: ref
                          .read(searchMoviesProvider.notifier)
                          .searchMoviesByQuery,
                      initialMovies: searchedMovies,
                    ),
                  ).then((movie) {
                    if (movie == null) return;

                    GoRouter.of(context).go('/movie/${movie.id}');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
