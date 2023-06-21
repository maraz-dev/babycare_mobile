import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/repositories/firebase_repository.dart';

class CreateBabyUsecase {
  final FirebaseRepository repository;
  CreateBabyUsecase({required this.repository});

  Future<void> call(
    String babyId,
    Timestamp dateOfConception,
    String currentLocation,
    String prefferedHospital,
    String preferredDoctor,
  ) async {
    repository.createBaby(
      babyId,
      dateOfConception,
      currentLocation,
      prefferedHospital,
      preferredDoctor,
    );
  }
}
