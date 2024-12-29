part of 'student_bloc.dart';

@immutable
sealed class StudentState {
  final List<Student> std;
  const StudentState(this.std);
}

final class StudentInitial extends StudentState {
  const StudentInitial(super.std);
}

final class StudentLoading extends StudentState {
  const StudentLoading(super.std);
}

final class StudentSuccess extends StudentState {
  const StudentSuccess(super.std);
}
