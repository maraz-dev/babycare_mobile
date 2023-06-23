import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required String doctorId,
    required String name,
    required String email,
    required String phoneNumber,
    required String currentHospital,
    required double yearsOfExperience,
    required String ninNumber,
    required String officialHospitalContact,
    required String location,
  }) : super(
          doctorId,
          name,
          email,
          phoneNumber,
          currentHospital,
          yearsOfExperience,
          ninNumber,
          officialHospitalContact,
          location,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      doctorId: json['doctorId'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      currentHospital: json['currentHospital'],
      yearsOfExperience: json['yearsOfExperience'],
      ninNumber: json['ninNumber'],
      officialHospitalContact: json['officialHospitalContact'],
      location: json['location'],
    );
  }

  factory DoctorModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return DoctorModel(
      doctorId: (documentSnapshot.data()! as dynamic)['doctorId'],
      name: (documentSnapshot.data()! as dynamic)['name'],
      email: (documentSnapshot.data()! as dynamic)['email'],
      phoneNumber: (documentSnapshot.data()! as dynamic)['phoneNumber'],
      currentHospital: (documentSnapshot.data()! as dynamic)['currentHospital'],
      yearsOfExperience:
          (documentSnapshot.data()! as dynamic)['yearsOfExperience'],
      ninNumber: (documentSnapshot.data()! as dynamic)['ninNumber'],
      officialHospitalContact:
          (documentSnapshot.data()! as dynamic)['officialHospitalContact'],
      location: (documentSnapshot.data()! as dynamic)['location'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "doctorId": doctorId,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "currentHospital": currentHospital,
      "yearsOfExperience": yearsOfExperience,
      "ninNumber": ninNumber,
      "officialHospitalContact": officialHospitalContact,
      "location": location,
    };
  }
}
