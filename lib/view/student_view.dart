import 'package:class_assignment_2/bloc/student_bloc.dart';
import 'package:class_assignment_2/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => StudentViewState();
}

class StudentViewState extends State<StudentView> {
  final _nameControl = TextEditingController();
  final _addressControl = TextEditingController();
  final _ageControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student View Bloc"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameControl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "name"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ageControl,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "age"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressControl,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "address"),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  // final std = Student(
                  //     name: _nameControl.text,
                  //     address: _addressControl.text,
                  //     age: int.tryParse(_ageControl.text) ?? 0);
                  context.read<StudentBloc>().add(SubmitEvent(
                      _nameControl.text,
                      int.tryParse(_ageControl.text) ?? 0,
                      _addressControl.text));
                },
                child: Text("Submit")),
            const SizedBox(height: 8),
            Flexible(
              child: BlocBuilder<StudentBloc, StudentState>(
                builder: (context, state) {
                  print(state.runtimeType);
                  if (state is StudentInitial) {
                    return const Text("No Data");
                  } else if (state is StudentLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: state.std.length,
                      itemBuilder: (context, index) {
                        Student std = state.std.elementAt(index);
                        return ListTile(
                          title: Text(std.name),
                          trailing: Text("${std.age}"),
                          subtitle: Text(std.address),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
