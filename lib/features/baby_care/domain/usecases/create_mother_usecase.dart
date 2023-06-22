import '../repositories/firebase_repository.dart';

class CreateMotherUsecase {
  final FirebaseRepository repository;
  CreateMotherUsecase({required this.repository});
  Future<void> call(
    String name,
    String email,
    String phoneNumber,
    String babyId,
  ) async {
    repository.createMother(
      name,
      email,
      phoneNumber,
      babyId,
    );
  }
}
