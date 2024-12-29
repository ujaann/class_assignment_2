import 'package:bloc/bloc.dart';
import 'package:class_assignment_2/model/student.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial([])) {
    on<SubmitEvent>((event, emit) async {
      List<Student> lst = state.std;
      emit(StudentLoading(lst));

      await Future.delayed(Duration(seconds: 1));
      lst = _addStudent(lst, event.name, event.address, event.age);
      emit(StudentSuccess(lst));
    });
  }

  List<Student> _addStudent(
      List<Student> lst, String name, String address, int age) {
    final student = Student(name: name, age: age, address: address);
    lst.add(student);
    return lst;
  }
}
