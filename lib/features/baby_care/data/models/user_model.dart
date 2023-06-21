import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String uid,
    required String userClass,
  }) : super(
          uid,
          userClass,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      userClass: json['userClass'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      uid: (documentSnapshot.data()! as dynamic)['uid'],
      userClass: (documentSnapshot.data()! as dynamic)['userClass'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "userClass": userClass,
    };
  }
}
