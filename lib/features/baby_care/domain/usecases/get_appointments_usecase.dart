import '../entities/appointment_entity.dart';
import '../repositories/firebase_repository.dart';

class GetAppointmentsUsecase {
  final FirebaseRepository repository;
  GetAppointmentsUsecase({
    required this.repository,
  });

  Stream<List<AppointmentEntity>> call() => repository.getAppointments();
}
