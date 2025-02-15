import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String phoneNumber;

  const MyUser(
      {required this.userId,
      required this.email,
      required this.name,
      required this.phoneNumber});

  static const empty = MyUser(userId: '', email: '', name: '', phoneNumber: '');

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    String? phoneNumber,
  }) {
    return MyUser(
        userId: userId ?? this.userId,
        email: email ?? this.email,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
        userId: userId, email: email, name: name, phoneNumber: phoneNumber);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userId: entity.userId,
        email: entity.email,
        name: entity.name,
        phoneNumber: entity.phoneNumber);
  }

  @override
  List<Object?> get props => [userId, email, name, phoneNumber];
}
