import '../entities/mother_entity.dart';

import '../repositories/firebase_repository.dart';

class GetMothersUsecase {
  final FirebaseRepository repository;
  GetMothersUsecase({
    required this.repository,
  });

  Stream<List<MotherEntity>> call() => repository.getMothers();
}
