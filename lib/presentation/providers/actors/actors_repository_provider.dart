import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/actor_moviedb_datasourse.dart';
import '../../../infrastructure/repositories/actor_repository_impl.dart';

// Este repositorio es inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
