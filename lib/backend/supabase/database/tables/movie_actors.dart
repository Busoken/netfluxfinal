import '../database.dart';

class MovieActorsTable extends SupabaseTable<MovieActorsRow> {
  @override
  String get tableName => 'movie_actors';

  @override
  MovieActorsRow createRow(Map<String, dynamic> data) => MovieActorsRow(data);
}

class MovieActorsRow extends SupabaseDataRow {
  MovieActorsRow(super.data);

  @override
  SupabaseTable get table => MovieActorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get movieId => getField<int>('movie_id')!;
  set movieId(int value) => setField<int>('movie_id', value);

  int? get actorId => getField<int>('actor_id');
  set actorId(int? value) => setField<int>('actor_id', value);
}
