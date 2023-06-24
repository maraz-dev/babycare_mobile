import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required String appointmentId,
    required Timestamp appointmentDateandTime,
    required String motherId,
    required String doctorId,
    required String location,
    required String hospital,
    required String motherName,
    required String doctorName,
  }) : super(
          appointmentId,
          appointmentDateandTime,
          motherId,
          doctorId,
          location,
          hospital,
          motherName,
          doctorName,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'],
      appointmentDateandTime: json['appointmentDateandTime'],
      motherId: json['motherId'],
      doctorId: json['doctorId'],
      location: json['location'],
      hospital: json['hospital'],
      motherName: json['motherName'],
      doctorName: json['doctorName'],
    );
  }

  factory AppointmentModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return AppointmentModel(
      appointmentId: (documentSnapshot.data()! as dynamic)['appointmentId'],
      appointmentDateandTime:
          (documentSnapshot.data()! as dynamic)['appointmentDateandTime'],
      motherId: (documentSnapshot.data()! as dynamic)['motherId'],
      doctorId: (documentSnapshot.data()! as dynamic)['doctorId'],
      location: (documentSnapshot.data()! as dynamic)['location'],
      hospital: (documentSnapshot.data()! as dynamic)['hospital'],
      motherName: (documentSnapshot.data()! as dynamic)['motherName'],
      doctorName: (documentSnapshot.data()! as dynamic)['doctorName'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "appointmentId": appointmentId,
      "appointmentDateandTime": appointmentDateandTime,
      "motherId": motherId,
      "doctorId": doctorId,
      "location": location,
      "hospital": hospital,
      "motherName": motherName,
      "doctorName": doctorName,
    };
  }
}
