
import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';

class LoginApiRequest extends LoginRequestInterface {
  String username;
  String password;

  LoginApiRequest({this.username, this.password});

  Map<String, dynamic> toJson() {
    var data = {
      "user_name": this.username,
      "password": this.password,
    };

    return {
      "data": data
    };
  }
}