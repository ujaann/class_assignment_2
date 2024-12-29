part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class SubmitEvent extends StudentEvent {
  final String name;
  final int age;
  final String address;

  SubmitEvent(this.name, this.age, this.address);
}
