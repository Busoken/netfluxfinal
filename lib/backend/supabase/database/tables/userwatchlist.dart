import '../database.dart';

class UserwatchlistTable extends SupabaseTable<UserwatchlistRow> {
  @override
  String get tableName => 'userwatchlist';

  @override
  UserwatchlistRow createRow(Map<String, dynamic> data) =>
      UserwatchlistRow(data);
}

class UserwatchlistRow extends SupabaseDataRow {
  UserwatchlistRow(super.data);

  @override
  SupabaseTable get table => UserwatchlistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get users => getField<String>('users');
  set users(String? value) => setField<String>('users', value);

  int? get uwatchlist => getField<int>('uwatchlist');
  set uwatchlist(int? value) => setField<int>('uwatchlist', value);
}
