import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/entities/baby_entity.dart';

class BabyModel extends BabyEntity {
  const BabyModel({
    required String babyId,
    required Timestamp dateOfConception,
    required String currentLocation,
    required String prefferedHospital,
    required String preferredDoctor,
  }) : super(
          babyId,
          dateOfConception,
          currentLocation,
          prefferedHospital,
          preferredDoctor,
        );

  factory BabyModel.fromJson(Map<String, dynamic> json) {
    return BabyModel(
      babyId: json['babyId'],
      dateOfConception: json['dateOfConception'],
      currentLocation: json['currentLocation'],
      prefferedHospital: json['prefferedHospital'],
      preferredDoctor: json['preferredDoctor'],
    );
  }

  factory BabyModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return BabyModel(
      babyId: (documentSnapshot.data()! as dynamic)['babyId'],
      dateOfConception:
          (documentSnapshot.data()! as dynamic)['dateOfConception'],
      currentLocation: (documentSnapshot.data()! as dynamic)['currentLocation'],
      prefferedHospital:
          (documentSnapshot.data()! as dynamic)['prefferedHospital'],
      preferredDoctor: (documentSnapshot.data()! as dynamic)['preferredDoctor'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "babyId": babyId,
      "dateOfConception": dateOfConception,
      "currentLocation": currentLocation,
      "prefferedHospital": prefferedHospital,
      "preferredDoctor": preferredDoctor,
    };
  }
}
