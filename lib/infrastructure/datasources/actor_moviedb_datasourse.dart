import 'package:dio/dio.dart';
import 'package:whats_movie_flutter_app/infrastructure/models/models.dart';

import '../../config/constants/environment.dart';
import '../../domain/datasources/actors_datasourse.dart';
import '../../domain/entities/actor.dart';
import '../mappers/actor_mapper.dart';

class ActorMovieDbDatasource extends ActorDatasource {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits',
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast!
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
