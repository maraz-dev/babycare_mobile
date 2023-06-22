part of 'appointment_cubit.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState();
}

class AppointmentInitial extends AppointmentState {
  @override
  List<Object> get props => [];
}

class AppointmentFailure extends AppointmentState {
  final String errorMessage;

  const AppointmentFailure(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class AppointmentLoading extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentSuccess extends AppointmentState {
  @override
  List<Object?> get props => [];
}

class AppointmentLoaded extends AppointmentState {
  final List<AppointmentEntity> appointments;
  const AppointmentLoaded({
    required this.appointments,
  });
  @override
  List<Object?> get props => [appointments];
}
