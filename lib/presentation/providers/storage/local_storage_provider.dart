import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whats_movie_flutter_app/infrastructure/datasources/isar_local_storage_datasource.dart';
import 'package:whats_movie_flutter_app/infrastructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarLocalStorageDatasource());
});
