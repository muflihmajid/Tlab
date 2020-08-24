// Declaring Entities and its property
class User {
  int id;
  bool isRegistered;
  Token token;
  Profile profile;
  
  User({this.id, this.isRegistered, this.token, this.profile});
}

class Token {
  String accessToken;
  int expiresAt;

  Token({this.accessToken, this.expiresAt});
}

class Profile {
  String name;
  String phone;
  String email;
  String photo;

  Profile({this.name, this.phone, this.email, this.photo});
}

