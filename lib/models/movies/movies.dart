import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  factory MoviesModel(
      {@Default('') String total, //total number of movies
      @Default(0) int page, //current page number
      @Default(0) int pages, //total number of pages
      @Default([]) List<TvShows> tvShow}) = _MoviesModel; //construct

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
class TvShows with _$TvShows {
  factory TvShows({
    @Default('') String? name,
    @Default('') String? permalink,
    @Default('') String? startDate,
    @Default('') String? endDate,
    @Default('') String? country,
    @Default('') String? network,
    @Default('') String? status,
    @Default('') String? imageThumbnailPath,
  }) = _TvShows; //construct

  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json);
}
