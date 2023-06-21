import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hephzibah/features/baby_care/domain/entities/baby_entity.dart';
import 'package:hephzibah/features/baby_care/domain/entities/doctor_entity.dart';
import 'package:hephzibah/features/baby_care/domain/entities/mother_entity.dart';

import '../entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
  Future<void> createDoctor(
    String name,
    String email,
    String phoneNumber,
    String currentHospital,
    double yearsOfExperience,
    String ninNumber,
    String officialHospitalContact,
  );
  Future<void> createMother(
    String name,
    String email,
    String phoneNumber,
    String babyId,
  );
  Future<void> createBaby(
    String babyId,
    Timestamp dateOfConception,
    String currentLocation,
    String prefferedHospital,
    String preferredDoctor,
  );
  Future<void> signOut();
  Stream<List<UserEntity>> getUsers();
  Stream<List<DoctorEntity>> getDoctors();
  Stream<List<MotherEntity>> getMothers();
  Stream<List<BabyEntity>> getBabies();
}
