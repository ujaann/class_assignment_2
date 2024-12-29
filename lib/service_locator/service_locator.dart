import 'package:class_assignment_2/bloc/dashboard_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerLazySingleton(() => DashboardBloc());
}
