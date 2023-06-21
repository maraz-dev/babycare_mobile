part of 'baby_cubit.dart';

abstract class BabyState extends Equatable {
  const BabyState();
}

class BabyInitial extends BabyState {
  @override
  List<Object> get props => [];
}

class BabyLoaded extends BabyState {
  final List<BabyEntity> babies;
  const BabyLoaded({
    required this.babies,
  });
  @override
  List<Object?> get props => [babies];
}

class BabyLoading extends BabyState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
