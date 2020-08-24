import 'dart:async';

import 'package:clean_arc_flutter/data/persistences/repositories/user_repositories.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';


// Declaring usecase of the entity
class GetUserUseCase extends UseCase<User, void> {
  UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<Stream<User>> buildUseCaseStream(void ignore) async {
    final StreamController<User> controller = new StreamController();
    try {
      User user = await _repository.show();
      controller.add(user);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
