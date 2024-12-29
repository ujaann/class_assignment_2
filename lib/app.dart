import 'package:class_assignment_2/bloc/dashboard_bloc.dart';
import 'package:class_assignment_2/service_locator/service_locator.dart';
import 'package:class_assignment_2/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Assignment 2',
      home: BlocProvider.value(
        value: serviceLocator<DashboardBloc>(),
        child: DashboardView(),
      ),
    );
  }
}
