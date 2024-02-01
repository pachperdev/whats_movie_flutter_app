import 'package:dio/dio.dart';
import 'package:whats_movie_flutter_app/config/constants/environment.dart';

import '../domain/datasources/movies_datasource.dart';
import '../domain/entities/movie.dart';

class MovieDbDataSource extends MoviesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return [];
  }
}
