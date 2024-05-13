import '../../domain/entities/movie.dart';
import '../models/models.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult ?? false,
        backdropPath: moviedb.backdropPath != null
            ? 'https://media.themoviedb.org/t/p/w1920_and_h1080_multi_faces${moviedb.backdropPath}'
            : 'https://i.pinimg.com/originals/f3/49/0a/f3490a68228116c2e10987da151def9f.jpg',
        genreIds: moviedb.genreIds?.map((e) => e.toString()).toList() ?? [],
        id: moviedb.id ?? 0,
        originalLanguage: moviedb.originalLanguage ?? '',
        originalTitle: moviedb.originalTitle ?? '',
        overview: moviedb.overview ?? '',
        popularity: moviedb.popularity ?? 0.0,
        posterPath: moviedb.posterPath != null
            ? 'https://media.themoviedb.org/t/p/w600_and_h900_bestv2${moviedb.posterPath}'
            : 'https://i.pinimg.com/originals/f3/49/0a/f3490a68228116c2e10987da151def9f.jpg',
        releaseDate: moviedb.releaseDate ?? DateTime.now(),
        title: moviedb.title ?? '',
        video: moviedb.video ?? false,
        voteAverage: moviedb.voteAverage ?? 0.0,
        voteCount: moviedb.voteCount ?? 0,
      );

  static Movie movieDetailsToEntity(MovieDetails moviedb) => Movie(
        adult: moviedb.adult ?? false,
        backdropPath: moviedb.backdropPath != null
            ? 'https://media.themoviedb.org/t/p/w1920_and_h1080_multi_faces${moviedb.backdropPath}'
            : 'https://i.pinimg.com/originals/f3/49/0a/f3490a68228116c2e10987da151def9f.jpg',
        genreIds: moviedb.genres?.map((e) => e.name.toString()).toList() ?? [],
        id: moviedb.id ?? 0,
        originalLanguage: moviedb.originalLanguage ?? '',
        originalTitle: moviedb.originalTitle ?? '',
        overview: moviedb.overview ?? '',
        popularity: moviedb.popularity ?? 0.0,
        posterPath: moviedb.posterPath != null
            ? 'https://media.themoviedb.org/t/p/w600_and_h900_bestv2${moviedb.posterPath}'
            : 'https://i.pinimg.com/originals/f3/49/0a/f3490a68228116c2e10987da151def9f.jpg',
        releaseDate: moviedb.releaseDate ?? DateTime.now(),
        title: moviedb.title ?? '',
        video: moviedb.video ?? false,
        voteAverage: moviedb.voteAverage ?? 0.0,
        voteCount: moviedb.voteCount ?? 0,
      );
}
