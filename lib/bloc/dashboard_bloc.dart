// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:class_assignment_2/view/area_circle_view.dart';
import 'package:class_assignment_2/view/simple_interest_view.dart';
import 'package:class_assignment_2/view/student_view.dart';
import 'package:flutter/material.dart';

part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, void> {
  DashboardBloc() : super(null) {
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
        context, MaterialPageRoute(builder: (context) => AreaCircleView()));
  }

  void _openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SimpleInterestView()));
  }

  void _openStudentView(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StudentView()));
  }
}
