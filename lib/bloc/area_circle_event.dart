part of 'area_circle_bloc.dart';

@immutable
sealed class AreaCircleEvent {}

class CalculateEvent extends AreaCircleEvent {
  final double radius;

  CalculateEvent(this.radius);
}
