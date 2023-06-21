import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class GetUsersUsecase {
  final FirebaseRepository repository;
  GetUsersUsecase({
    required this.repository,
  });

  Stream<List<UserEntity>> call() => repository.getUsers();
}
