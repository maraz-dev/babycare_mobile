import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hephzibah/features/baby_care/domain/usecases/get_doctors_usecase.dart';

import '../../../domain/entities/doctor_entity.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final GetDoctorsUsecase getDoctorsUsecase;
  DoctorCubit({
    required this.getDoctorsUsecase,
  }) : super(DoctorInitial());

  Future<void> getDoctors() async {
    try {
      final doctor = getDoctorsUsecase.call();
      doctor.listen((doctors) {
        emit(DoctorLoaded(doctors: doctors));
      });
    } on SocketException catch (_) {}
  }
}
