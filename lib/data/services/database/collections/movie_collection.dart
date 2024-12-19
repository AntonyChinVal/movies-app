import 'package:isar/isar.dart';

part 'movie_collection.g.dart';

@Collection()
class MovieCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int movieId;

  late bool adult;
  late String? backdropPath;
  late List<int> genreIds;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String? posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
}
