import '../database.dart';

class DirectorsTable extends SupabaseTable<DirectorsRow> {
  @override
  String get tableName => 'directors';

  @override
  DirectorsRow createRow(Map<String, dynamic> data) => DirectorsRow(data);
}

class DirectorsRow extends SupabaseDataRow {
  DirectorsRow(super.data);

  @override
  SupabaseTable get table => DirectorsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);
}
