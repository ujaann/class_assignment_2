import 'package:class_assignment_2/bloc/area_circle_bloc.dart';
import 'package:class_assignment_2/bloc/dashboard_bloc.dart';
import 'package:class_assignment_2/bloc/simple_interest_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerLazySingleton(() => SimpleInterestBloc());
  serviceLocator.registerLazySingleton(() => AreaCircleBloc());
  serviceLocator.registerLazySingleton(
      () => DashboardBloc(serviceLocator(), serviceLocator()));
}
