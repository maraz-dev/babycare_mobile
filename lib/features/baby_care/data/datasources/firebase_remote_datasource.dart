import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hephzibah/features/baby_care/data/models/baby_model.dart';
import 'package:hephzibah/features/baby_care/data/models/doctor_model.dart';
import 'package:hephzibah/features/baby_care/data/models/mother_model.dart';

abstract class FirebaseRemoteDatasource {
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
}

class FirebaseRemoteDatasourceImpl implements FirebaseRemoteDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _doctorCollection = FirebaseFirestore.instance.collection('doctors');
  final _motherCollection = FirebaseFirestore.instance.collection('mothers');
  final _babyCollection = FirebaseFirestore.instance.collection('babies');
  final _userCollection = FirebaseFirestore.instance.collection('users');
  @override
  Future<void> createBaby(
      String babyId,
      Timestamp dateOfConception,
      String currentLocation,
      String prefferedHospital,
      String preferredDoctor) async {
    final newBaby = BabyModel(
      babyId: babyId,
      dateOfConception: dateOfConception,
      currentLocation: currentLocation,
      prefferedHospital: prefferedHospital,
      preferredDoctor: preferredDoctor,
    ).toDocument();
    _babyCollection.doc(babyId).set(newBaby);
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
    _doctorCollection.doc(_auth.currentUser!.uid).get().then((doctor) {
      if (!doctor.exists) {
        _userCollection.doc(_auth.currentUser!.uid).set({
          'uid': _auth.currentUser!.uid,
          'class': 'doctor',
        });
        final newDoctor = DoctorModel(
          doctorId: _auth.currentUser!.uid,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          currentHospital: currentHospital,
          yearsOfExperience: yearsOfExperience,
          ninNumber: ninNumber,
          officialHospitalContact: officialHospitalContact,
        ).toDocument();
        _doctorCollection.doc(_auth.currentUser!.uid).set(newDoctor);
        return;
      }
    });
  }

  @override
  Future<void> createMother(
    String name,
    String email,
    String phoneNumber,
    String babyId,
  ) async {
    _motherCollection.doc(_auth.currentUser!.uid).get().then((mother) {
      if (!mother.exists) {
        _userCollection.doc(_auth.currentUser!.uid).set({
          'uid': _auth.currentUser!.uid,
          'class': 'mother',
        });
        final newMother = MotherModel(
          motherId: _auth.currentUser!.uid,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          babyId: babyId,
        ).toDocument();
        _motherCollection.doc(_auth.currentUser!.uid).set(newMother);
        return;
      }
    });
  }

  @override
  Future<String> getCurrentUid() async => _auth.currentUser!.uid;

  @override
  // ignore: unnecessary_null_comparison
  Future<bool> isSignIn() async => _auth.currentUser!.uid != null;

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
