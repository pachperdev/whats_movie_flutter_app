import '../entities/actor.dart';

abstract class ActorDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
