import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final bool? adult;
  final String? backdropPath;
  final List<String>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final DocumentSnapshot? docSnapshot;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.docSnapshot,
  });

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'id': id,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'releaseDate': releaseDate?.toIso8601String(),
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map,
      {DocumentSnapshot? snapshot}) {
    return Movie(
      adult: map['adult'],
      backdropPath: map['backdropPath'],
      genreIds: List<String>.from(map['genreIds']),
      id: map['id'],
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['posterPath'],
      releaseDate: map['releaseDate'] != null
          ? DateTime.parse(map['releaseDate'])
          : null,
      title: map['title'],
      video: map['video'],
      voteAverage: map['voteAverage'],
      voteCount: map['voteCount'],
      docSnapshot: snapshot,
    );
  }
}
