import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String phoneNumber;

  const MyUserEntity(
      {required this.userId,
      required this.email,
      required this.name,
      required this.phoneNumber});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        userId: doc['userId'],
        email: doc['email'],
        name: doc['name'],
        phoneNumber: doc['phoneNumber']);
  }

  @override
  List<Object?> get props => [userId, email, name, phoneNumber];
}
