import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_babies_usecase.dart';

import '../../../domain/entities/baby_entity.dart';

part 'baby_state.dart';

class BabyCubit extends Cubit<BabyState> {
  final GetBabiesUsecase getBabiesUsecase;
  BabyCubit({
    required this.getBabiesUsecase,
  }) : super(BabyInitial());

  Future<void> getBabies() async {
    try {
      final baby = getBabiesUsecase.call();
      baby.listen((babies) {
        emit(BabyLoaded(babies: babies));
      });
    } on SocketException catch (_) {}
  }
}
