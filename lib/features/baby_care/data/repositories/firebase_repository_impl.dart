import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/data/datasources/firebase_remote_datasource.dart';
import 'package:hephzibah/features/baby_care/domain/entities/baby_entity.dart';
import 'package:hephzibah/features/baby_care/domain/entities/doctor_entity.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';
import 'package:hephzibah/features/baby_care/domain/entities/user_entity.dart';
import 'package:hephzibah/features/baby_care/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDatasource firebaseRemoteDatasource;
  FirebaseRepositoryImpl({
    required this.firebaseRemoteDatasource,
  });
  @override
  Future<void> createBaby(
      String babyId,
      Timestamp dateOfConception,
      String currentLocation,
      String prefferedHospital,
      String preferredDoctor) async {
    return await firebaseRemoteDatasource.createBaby(
      babyId,
      dateOfConception,
      currentLocation,
      prefferedHospital,
      preferredDoctor,
    );
  }

  @override
  Future<void> createDoctor(
      String name,
      String email,
      String phoneNumber,
      String currentHospital,
      double yearsOfExperience,
      String ninNumber,
      String officialHospitalContact) async {
    return await firebaseRemoteDatasource.createDoctor(
      name,
      email,
      phoneNumber,
      currentHospital,
      yearsOfExperience,
      ninNumber,
      officialHospitalContact,
    );
  }

  @override
  Future<void> createMother(
      String name, String email, String phoneNumber, String babyId) async {
    return await firebaseRemoteDatasource.createMother(
      name,
      email,
      phoneNumber,
      babyId,
    );
  }

  @override
  Future<String> getCurrentUid() async =>
      await firebaseRemoteDatasource.getCurrentUid();

  @override
  Future<bool> isSignIn() async => await firebaseRemoteDatasource.isSignIn();

  @override
  Future<void> signIn(String email, String password) async =>
      await firebaseRemoteDatasource.signIn(
        email,
        password,
      );

  @override
  Future<void> signOut() async => await firebaseRemoteDatasource.signOut();

  @override
  Future<void> signUp(
    String email,
    String password,
  ) async =>
      await firebaseRemoteDatasource.signUp(
        email,
        password,
      );

  @override
  Stream<List<BabyEntity>> getBabies() {
    return firebaseRemoteDatasource.getBabies();
  }

  @override
  Stream<List<DoctorEntity>> getDoctors() {
    return firebaseRemoteDatasource.getDoctors();
  }

  @override
  Stream<List<MotherEntity>> getMothers() {
    return firebaseRemoteDatasource.getMothers();
  }

  @override
  Stream<List<UserEntity>> getUsers() {
    return firebaseRemoteDatasource.getUsers();
  }

  @override
  Future<void> bookAppointment(
    Timestamp appointmentDateandTime,
    String doctorId,
    String motherId,
    String location,
    String hospital,
  ) async {
    return await firebaseRemoteDatasource.bookAppointment(
      appointmentDateandTime,
      doctorId,
      motherId,
      location,
      hospital,
    );
  }
}
