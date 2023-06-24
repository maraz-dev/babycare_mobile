
import '../entities/text_message_entity.dart';
import '../repositories/firebase_repository.dart';

class SendTextMessageUseCase {
  final FirebaseRepository repository;

  SendTextMessageUseCase({required this.repository});

  Future<void> call(TextMessageEntity textMessage) async {
    return repository.sendTextMessage(textMessage);
  }
}
