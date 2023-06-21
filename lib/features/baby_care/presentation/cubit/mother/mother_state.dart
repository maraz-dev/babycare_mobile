part of 'mother_cubit.dart';

abstract class MotherState extends Equatable {
  const MotherState();
}

class MotherInitial extends MotherState {
  @override
  List<Object> get props => [];
}

class MotherLoaded extends MotherState {
  final List<MotherEntity> mothers;
  const MotherLoaded({
    required this.mothers,
  });
  @override
  List<Object?> get props => [mothers];
}

class MotherLoading extends MotherState {
  @override
  List<Object?> get props => throw UnimplementedError();
}