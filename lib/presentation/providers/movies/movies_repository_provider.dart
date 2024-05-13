import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/moviedb_datasource.dart';
import '../../../infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDataSource());
});
