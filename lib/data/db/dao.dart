
abstract class Dao<T> {
  String get tableName;
  String get createTableQuery;
  
  T fromMap(Map<String, dynamic> query);
  List<T> fromList(List<Map<String, dynamic>> query);
  Map<String, dynamic> toMap(T object);
}
