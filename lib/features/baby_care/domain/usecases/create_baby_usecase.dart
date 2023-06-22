import 'package:cloud_firestore/cloud_firestore.dart';
import '../repositories/firebase_repository.dart';

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
