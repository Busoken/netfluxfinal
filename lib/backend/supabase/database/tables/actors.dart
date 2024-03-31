import '../database.dart';

class ActorsTable extends SupabaseTable<ActorsRow> {
  @override
  String get tableName => 'actors';

  @override
  ActorsRow createRow(Map<String, dynamic> data) => ActorsRow(data);
}

class ActorsRow extends SupabaseDataRow {
  ActorsRow(super.data);

  @override
  SupabaseTable get table => ActorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);
}
