part of 'doctor_cubit.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();
}

class DoctorInitial extends DoctorState {
  @override
  List<Object> get props => [];
}

class DoctorLoaded extends DoctorState {
  final List<DoctorEntity> doctors;
  const DoctorLoaded({
    required this.doctors,
  });
  @override
  List<Object?> get props =>[doctors];
}

class DoctorLoading extends DoctorState {
  @override
  List<Object?> get props => throw UnimplementedError();
}