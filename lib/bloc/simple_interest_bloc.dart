import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'simple_interest_event.dart';

class SimpleInterestBloc extends Bloc<SimpleInterestEvent, double> {
  SimpleInterestBloc() : super(0) {
    on<CalculateEvent>((event, emit) {
      final interest = event.principal * event.time * event.rate / 100;
      emit(interest);
    });
  }
}
