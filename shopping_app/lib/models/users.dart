import 'dart:convert';

class User {
  final String uid;
  final String username;
  final String email;
  final String userType;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.userType,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'userType': userType
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      userType: map['userType'] ?? '',
    );
  }
}
