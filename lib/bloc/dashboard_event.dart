part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class AreaOfCircleEvent extends DashboardEvent {
  final BuildContext context;

  AreaOfCircleEvent(this.context);
}

class SimpleInterestEvent extends DashboardEvent {
  final BuildContext context;

  SimpleInterestEvent(this.context);
}

class StudentListEvent extends DashboardEvent {
  final BuildContext context;

  StudentListEvent(this.context);
}
