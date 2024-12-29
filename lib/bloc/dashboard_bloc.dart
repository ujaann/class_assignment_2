import 'package:class_assignment_2/bloc/area_circle_bloc.dart';
import 'package:class_assignment_2/bloc/simple_interest_bloc.dart';
import 'package:class_assignment_2/view/area_circle_view.dart';
import 'package:class_assignment_2/view/simple_interest_view.dart';
import 'package:class_assignment_2/view/student_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, void> {
  final SimpleInterestBloc _simpleInterestBloc;
  final AreaCircleBloc _areaCircleBloc;

  DashboardBloc(
    this._simpleInterestBloc,
    this._areaCircleBloc,
  ) : super(null) {
    on<AreaOfCircleEvent>((event, emit) {
      _openAreaOfCircleView(event.context);
    });
    on<SimpleInterestEvent>((event, emit) {
      _openSimpleInterestView(event.context);
    });
    on<StudentListEvent>((event, emit) {
      _openStudentView(event.context);
    });
  }

  void _openAreaOfCircleView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _areaCircleBloc,
                  child: AreaCircleView(),
                )));
  }

  void _openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _simpleInterestBloc,
                  child: SimpleInterestView(),
                )));
  }

  void _openStudentView(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentView()));
  }
}
