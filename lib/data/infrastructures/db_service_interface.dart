abstract class DBServiceInterface {
  Future<int> insert(String sql, List<dynamic> arguments);
  Future<int> update(String sql, List<dynamic> arguments);
  Future<int> delete(String sql, List<dynamic> arguments);
  Future<List<Map>> select(String sql, List<dynamic> arguments);
}