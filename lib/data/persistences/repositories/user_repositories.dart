import 'package:clean_arc_flutter/domains/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getAll();
  Future<User> show();
}