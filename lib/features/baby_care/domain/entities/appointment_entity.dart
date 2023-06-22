import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final String appointmentId;
  final Timestamp appointmentDateandTime;
  final String motherId;
  final String doctorId;
  final String location;
  final String hospital;

  const AppointmentEntity(
    this.appointmentId,
    this.appointmentDateandTime,
    this.motherId,
    this.doctorId,
    this.location,
    this.hospital,
  );
  @override
  List<Object?> get props => [
        appointmentId,
        appointmentDateandTime,
        motherId,
        doctorId,
        location,
        hospital,
      ];
}
