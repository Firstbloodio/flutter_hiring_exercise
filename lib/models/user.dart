class User {
  final String token;
  final String firstName;
  final String lastName;
  final String userName;
  final String level;

  User({this.token,this.firstName,this.lastName,this.userName,this.level});

  factory User.fromJson(Map<String, String> json) {
    return User(
        token: json['token'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['username'],
        level: json['level'],
    );
  }
}
