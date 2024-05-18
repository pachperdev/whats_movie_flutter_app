import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_movie_flutter_app/domain/entities/movie.dart';
import '../../domain/datasources/local_storage_datasource.dart';

class FirestoreLocalStorageDatasource extends LocalStorageDatasource {
  final FirebaseFirestore firestore;

  FirestoreLocalStorageDatasource() : firestore = FirebaseFirestore.instance;

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final doc =
        await firestore.collection('movies').doc(movieId.toString()).get();
    return doc.exists;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final docRef = firestore.collection('movies').doc(movie.id.toString());

    final doc = await docRef.get();
    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set(movie.toMap());
    }
  }

  @override
  Future<List<Movie>> loadMovies(
      {int limit = 10, DocumentSnapshot? startAfter}) async {
    Query query = firestore.collection('movies').limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    final querySnapshot = await query.get();

    return querySnapshot.docs
        .map((doc) =>
            Movie.fromMap(doc.data() as Map<String, dynamic>, snapshot: doc))
        .toList();
  }
}
