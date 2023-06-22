import '../entities/doctor_entity.dart';
import '../repositories/firebase_repository.dart';

class GetDoctorsUsecase {
  final FirebaseRepository repository;
  GetDoctorsUsecase({
    required this.repository,
  });

  Stream<List<DoctorEntity>> call() => repository.getDoctors();
}
