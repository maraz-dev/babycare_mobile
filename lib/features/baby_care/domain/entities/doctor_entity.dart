import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final String doctorId;
  final String name;
  final String email;
  final String phoneNumber;
  final String currentHospital;
  final double yearsOfExperience;
  final String ninNumber;
  final String officialHospitalContact;
  final String location;
  final String status;

  const DoctorEntity(
    this.doctorId,
    this.name,
    this.email,
    this.phoneNumber,
    this.currentHospital,
    this.yearsOfExperience,
    this.ninNumber,
    this.officialHospitalContact,
    this.location,
    this.status,
  );
  @override
  List<Object?> get props => [
        doctorId,
        name,
        email,
        phoneNumber,
        currentHospital,
        yearsOfExperience,
        ninNumber,
        officialHospitalContact,
        location,
        status,
      ];
}
