import '../../domain/entities/movie.dart';
import '../models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
        adult: movieDB.adult ?? false,
        backdropPath: movieDB.backdropPath != null
            ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
            : 'https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg',
        genreIds: movieDB.genreIds?.map((e) => e.toString()).toList() ?? [],
        id: movieDB.id ?? 0,
        originalLanguage: movieDB.originalLanguage ?? '',
        originalTitle: movieDB.originalTitle ?? '',
        overview: movieDB.overview ?? '',
        popularity: movieDB.popularity ?? 0.0,
        posterPath: movieDB.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
            : 'no-poster-path',
        releaseDate: movieDB.releaseDate ?? DateTime.now(),
        title: movieDB.title ?? '',
        video: movieDB.video ?? false,
        voteAverage: movieDB.voteAverage ?? 0.0,
        voteCount: movieDB.voteCount ?? 0,
      );
}
