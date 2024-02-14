import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events for the Cubit
abstract class HomeEvent {}

// Define the states for the Cubit
abstract class HomeState {}

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0); // Initial screen index

  void emitScreen(int index) {
    emit(index);
  }
}