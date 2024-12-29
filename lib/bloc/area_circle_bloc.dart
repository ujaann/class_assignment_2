import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'area_circle_event.dart';

class AreaCircleBloc extends Bloc<AreaCircleEvent, double> {
  AreaCircleBloc() : super(0) {
    on<CalculateEvent>((event, emit) {
      final area = pi * event.radius * event.radius;
      emit(area);
    });
  }
}
