import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';

// Declaring interface that the entity should be implemented
abstract class AuthRepository {
  Future<User> login(LoginRequestInterface loginRequest);
}
