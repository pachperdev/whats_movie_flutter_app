import '../../domain/entities/actor.dart';
import '../models/models.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://i.pinimg.com/originals/7a/1b/96/7a1b969b9dabc148683e3919a09aaec4.jpg',
      character: cast.character,
    );
  }
}
