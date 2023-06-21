import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';

class MotherModel extends MotherEntity {
  const MotherModel({
    required String motherId,
    required String name,
    required String email,
    required String phoneNumber,
    required String babyId,
  }) : super(
          motherId,
          name,
          email,
          phoneNumber,
          babyId,
        );

  factory MotherModel.fromJson(Map<String, dynamic> json) {
    return MotherModel(
      motherId: json['motherId'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      babyId: json['babyId'],
    );
  }

  factory MotherModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return MotherModel(
      motherId: (documentSnapshot.data()! as dynamic)['motherId'],
      name: (documentSnapshot.data()! as dynamic)['name'],
      email: (documentSnapshot.data()! as dynamic)['email'],
      phoneNumber: (documentSnapshot.data()! as dynamic)['phoneNumber'],
      babyId: (documentSnapshot.data()! as dynamic)['babyId'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "motherId": motherId,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "babyId": babyId,
    };
  }
}
