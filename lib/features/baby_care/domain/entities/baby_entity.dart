import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BabyEntity extends Equatable {
  final String babyId;
  final Timestamp dateOfConception;
  final String currentLocation;
  final String prefferedHospital;
  final String preferredDoctor;

  const BabyEntity(
    this.babyId,
    this.dateOfConception,
    this.currentLocation,
    this.prefferedHospital,
    this.preferredDoctor,
  );
  @override
  List<Object?> get props => [
        babyId,
        dateOfConception,
        currentLocation,
        prefferedHospital,
        preferredDoctor,
      ];
}
