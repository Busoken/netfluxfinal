import '../database.dart';

class MoviesTable extends SupabaseTable<MoviesRow> {
  @override
  String get tableName => 'movies';

  @override
  MoviesRow createRow(Map<String, dynamic> data) => MoviesRow(data);
}

class MoviesRow extends SupabaseDataRow {
  MoviesRow(super.data);

  @override
  SupabaseTable get table => MoviesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  int? get directorId => getField<int>('director_id');
  set directorId(int? value) => setField<int>('director_id', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get genre => getField<String>('genre');
  set genre(String? value) => setField<String>('genre', value);
}
