import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hephzibah/features/baby_care/domain/usecases/get_mothers_usecase.dart';

import '../../../domain/entities/mother_entity.dart';

part 'mother_state.dart';

class MotherCubit extends Cubit<MotherState> {
  final GetMothersUsecase getMothersUsecase;
  MotherCubit({
    required this.getMothersUsecase,
  }) : super(MotherInitial());

  Future<void> getMothers() async {
    try {
      final mother = getMothersUsecase.call();
      mother.listen((mothers) {
        emit(MotherLoaded(mothers: mothers));
      });
    } on SocketException catch (_) {}
  }
}
