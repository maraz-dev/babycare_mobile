

import '../entities/text_message_entity.dart';
import '../repositories/firebase_repository.dart';

class GetMessagesUsecase {
  final FirebaseRepository repository;

  GetMessagesUsecase({required this.repository});

  Stream<List<TextMessageEntity>> call()  => repository.getMessages();
}
