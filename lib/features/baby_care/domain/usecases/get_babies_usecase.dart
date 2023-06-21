import 'package:hephzibah/features/baby_care/domain/entities/baby_entity.dart';

import '../repositories/firebase_repository.dart';

class GetBabiesUsecase {
  final FirebaseRepository repository;
  GetBabiesUsecase({
    required this.repository,
  });

  Stream<List<BabyEntity>> call() => repository.getBabies();
}
