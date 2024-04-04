import '../../domain/entities/movie.dart';
import '../models/models.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult ?? false,
        backdropPath: moviedb.backdropPath != null
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg',
        genreIds: moviedb.genreIds?.map((e) => e.toString()).toList() ?? [],
        id: moviedb.id ?? 0,
        originalLanguage: moviedb.originalLanguage ?? '',
        originalTitle: moviedb.originalTitle ?? '',
        overview: moviedb.overview ?? '',
        popularity: moviedb.popularity ?? 0.0,
        posterPath: moviedb.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'no-poster-path',
        releaseDate: moviedb.releaseDate ?? DateTime.now(),
        title: moviedb.title ?? '',
        video: moviedb.video ?? false,
        voteAverage: moviedb.voteAverage ?? 0.0,
        voteCount: moviedb.voteCount ?? 0,
      );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult ?? false,
        backdropPath: moviedb.backdropPath != null
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg',
        genreIds: moviedb.genres?.map((e) => e.name.toString()).toList() ?? [],
        id: moviedb.id ?? 0,
        originalLanguage: moviedb.originalLanguage ?? '',
        originalTitle: moviedb.originalTitle ?? '',
        overview: moviedb.overview ?? '',
        popularity: moviedb.popularity ?? 0.0,
        posterPath: moviedb.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg',
        releaseDate: moviedb.releaseDate ?? DateTime.now(),
        title: moviedb.title ?? '',
        video: moviedb.video ?? false,
        voteAverage: moviedb.voteAverage ?? 0.0,
        voteCount: moviedb.voteCount ?? 0,
      );
}
