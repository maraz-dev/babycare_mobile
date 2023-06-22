import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required String appointmentId,
    required Timestamp appointmentDateandTime,
    required String motherId,
    required String doctorId,
    required String location,
    required String hospital,
  }) : super(
          appointmentId,
          appointmentDateandTime,
          motherId,
          doctorId,
          location,
          hospital,
        );

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json['appointmentId'],
      appointmentDateandTime: json['appointmentDateandTime'],
      motherId: json['motherId'],
      doctorId: json['doctorId'],
      location: json['location'],
      hospital: json['hospital'],
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
    };
  }
}
