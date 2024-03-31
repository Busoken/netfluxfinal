import '../database.dart';

class CategoryGoriesTable extends SupabaseTable<CategoryGoriesRow> {
  @override
  String get tableName => 'category_gories';

  @override
  CategoryGoriesRow createRow(Map<String, dynamic> data) =>
      CategoryGoriesRow(data);
}

class CategoryGoriesRow extends SupabaseDataRow {
  CategoryGoriesRow(super.data);

  @override
  SupabaseTable get table => CategoryGoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
