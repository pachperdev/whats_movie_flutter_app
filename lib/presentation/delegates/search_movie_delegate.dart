import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String get searchFieldLabel => 'Buscar filmes...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
          child: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () {
              query = '';
            },
          ),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('Build Results'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      },
    );
  }
}
