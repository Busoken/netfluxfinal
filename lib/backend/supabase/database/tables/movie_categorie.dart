import '../database.dart';

class MovieCategorieTable extends SupabaseTable<MovieCategorieRow> {
  @override
  String get tableName => 'movie_categorie';

  @override
  MovieCategorieRow createRow(Map<String, dynamic> data) =>
      MovieCategorieRow(data);
}

class MovieCategorieRow extends SupabaseDataRow {
  MovieCategorieRow(super.data);

  @override
  SupabaseTable get table => MovieCategorieTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get movieId => getField<int>('movie_id');
  set movieId(int? value) => setField<int>('movie_id', value);

  int? get categoryId => getField<int>('category_id');
  set categoryId(int? value) => setField<int>('category_id', value);
}
