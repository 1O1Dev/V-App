import 'dart:convert';

class User {
  final String id;
  final String name;
  final String lastName;
  final String nickName;
  final String image;
  final String email;
  final String password;
  final String address;
  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.nickName,
    required this.image,
    required this.email,
    required this.password,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'nickName': nickName,
      'image': image,
      'email': email,
      'password': password,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      nickName: map['nickName'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
