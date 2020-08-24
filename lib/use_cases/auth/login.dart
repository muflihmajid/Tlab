import 'dart:async';

import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/auth_repository.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginUseCase extends UseCase<User, LoginRequestInterface> {
  AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Stream<User>> buildUseCaseStream(LoginRequestInterface payload) async {
    final StreamController<User> controller = StreamController();
    try {
      User user = await _repository.login(payload);
      controller.add(user);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
