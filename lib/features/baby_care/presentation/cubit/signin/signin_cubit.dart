import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_baby_usecase.dart';
import '../../../domain/usecases/create_doctor_usecase.dart';
import '../../../domain/usecases/create_mother_usecase.dart';
import '../../../domain/usecases/sign_out_usecase.dart';

import '../../../domain/usecases/signin_usecase.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignupUsecase signupUsecase;
  final SigninUsecase signinUsecase;
  final SignoutUsecase signoutUsecase;
  final CreateDoctorUsecase createDoctorUsecase;
  final CreateMotherUsecase createMotherUsecase;
  final CreateBabyUsecase createBabyUsecase;
  SigninCubit({
    required this.signupUsecase,
    required this.signinUsecase,
    required this.signoutUsecase,
    required this.createDoctorUsecase,
    required this.createMotherUsecase,
    required this.createBabyUsecase,
  }) : super(SigninInitial());

  Future<void> submitSignin({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    try {
      await signinUsecase.call(email, password);
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }

  Future<void> submitSignOut() async {
    try {
      await signoutUsecase.call();
    } on SocketException catch (_) {}
  }

  Future<void> registerDoctor({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String currentHospital,
    required double yearsOfExperience,
    required String ninNumber,
    required String officialHospitalContact,
  }) async {
    emit(SigninLoading());
    try {
      await signupUsecase.call(email, password);
      await createDoctorUsecase.call(
        name,
        email,
        phoneNumber,
        currentHospital,
        yearsOfExperience,
        ninNumber,
        officialHospitalContact,
      );
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (e) {
      emit(SigninFailure(e.toString()));
    }
  }

  Future<void> registerMother({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String babyId,
  }) async {
    emit(SigninLoading());
    try {
      await signupUsecase.call(email, password);
      await createMotherUsecase.call(
        name,
        email,
        phoneNumber,
        babyId,
      );
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }

  Future<void> registerBaby({
    required String babyId,
    required Timestamp dateOfConception,
    required String currentLocation,
    required String prefferedHospital,
    required String preferredDoctor,
  }) async {
    emit(SigninLoading());
    try {
      await createBabyUsecase.call(
        babyId,
        dateOfConception,
        currentLocation,
        prefferedHospital,
        preferredDoctor,
      );
      emit(SigninSuccess());
    } on SocketException catch (e) {
      emit(SigninFailure(e.message));
    } catch (_) {
      emit(const SigninFailure("Firebase Exception"));
    }
  }
}
