import '../../domain/entities/actor.dart';
import '../models/models.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null || cast.profilePath != ''
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://st3.depositphotos.com/4111759/13425/v/600/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
      character: cast.character,
    );
  }
}
