import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String userClass;

  const UserEntity(
    this.uid,
    this.userClass,
  );

  @override
  List<Object?> get props => [
    uid,
    userClass,
  ];
}
