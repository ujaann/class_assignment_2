part of 'simple_interest_bloc.dart';

@immutable
sealed class SimpleInterestEvent {}

class CalculateEvent extends SimpleInterestEvent {
  final double principal;
  final double time;
  final double rate;

  CalculateEvent(this.principal, this.time, this.rate);
}
