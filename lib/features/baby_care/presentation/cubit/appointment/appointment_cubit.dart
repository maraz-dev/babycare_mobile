import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hephzibah/features/baby_care/domain/usecases/book_appointment_usecase.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final BookAppointmentUsecase bookAppointmentUsecase;
  AppointmentCubit({
    required this.bookAppointmentUsecase,
  }) : super(AppointmentInitial());

  Future<void> bookAppointment({
    required Timestamp appointmentDateandTime,
    required String doctorId,
    required String motherId,
    required String location,
    required String hospital,
  }) async {
    emit(AppointmentLoading());
    try {
      await bookAppointmentUsecase.call(
        appointmentDateandTime,
        doctorId,
        motherId,
        location,
        hospital,
      );
      emit(AppointmentSuccess());
    } on SocketException catch (e) {
      emit(AppointmentFailure(e.message));
    } catch (_) {
      emit(const AppointmentFailure("Firebase Exception"));
    }
  }
}
