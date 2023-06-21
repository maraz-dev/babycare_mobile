import 'package:hephzibah/features/baby_care/domain/repositories/firebase_repository.dart';

class CreateDoctorUsecase {
  final FirebaseRepository repository;
  CreateDoctorUsecase({required this.repository});
  Future<void> call(
    String name,
    String email,
    String phoneNumber,
    String currentHospital,
    double yearsOfExperience,
    String ninNumber,
    String officialHospitalContact,
  ) async {
    repository.createDoctor(
      name,
      email,
      phoneNumber,
      currentHospital,
      yearsOfExperience,
      ninNumber,
      officialHospitalContact,
    );
  }
}
