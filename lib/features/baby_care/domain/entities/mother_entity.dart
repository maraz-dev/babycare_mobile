import 'package:equatable/equatable.dart';

class MotherEntity extends Equatable {
  final String motherId;
  final String name;
  final String email;
  final String phoneNumber;
  final String babyId;

  const MotherEntity(
    this.motherId,
    this.name,
    this.email,
    this.phoneNumber,
    this.babyId,
  );
  @override
  List<Object?> get props => [
        motherId,
        name,
        email,
        phoneNumber,
        babyId,
      ];
}
