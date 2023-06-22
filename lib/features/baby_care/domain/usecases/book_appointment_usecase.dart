import 'package:cloud_firestore/cloud_firestore.dart';

import '../repositories/firebase_repository.dart';

class BookAppointmentUsecase {
  final FirebaseRepository repository;
  BookAppointmentUsecase({required this.repository});

  Future<void> call(
    Timestamp appointmentDateandTime,
    String doctorId,
    String motherId,
    String location,
    String hospital,
  ) async {
    repository.bookAppointment(
      appointmentDateandTime,
      doctorId,
      motherId,
      location,
      hospital,
    );
  }
}
