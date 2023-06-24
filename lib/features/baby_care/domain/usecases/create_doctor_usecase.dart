import '../repositories/firebase_repository.dart';

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
    String location,
    String status,
  ) async {
    repository.createDoctor(
      name,
      email,
      phoneNumber,
      currentHospital,
      yearsOfExperience,
      ninNumber,
      officialHospitalContact,
      location,
      status,
    );
  }
}
