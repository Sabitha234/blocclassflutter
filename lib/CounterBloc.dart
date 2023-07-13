import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterEvents.dart';
import 'CounterStates.dart';

//import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocs extends Bloc<CounterEvents, CounterStates>{
  CounterBlocs():super(InitialState()){
    on<Increment>((event, emit){
      emit(CounterStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      emit(CounterStates(counter: state.counter-1));
    });
  }
}