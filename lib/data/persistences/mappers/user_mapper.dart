

import 'package:clean_arc_flutter/domains/entities/user.dart';

class UserMapper {
  User getUserApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    return User(
      id: data['id'],
      isRegistered: data['is_registered'],      
      profile: Profile(
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
      ),
    );
  }
}
