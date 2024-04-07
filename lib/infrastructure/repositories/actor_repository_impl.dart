import 'package:whats_movie_flutter_app/domain/entities/actor.dart';

import '../../domain/datasources/actors_datasourse.dart';
import '../../domain/repositories/actors_repository.dart';

class ActorRepositoryImpl implements ActorsRepository {
  final ActorDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String id) async {
    return datasource.getActorsByMovie(id);
  }
}
