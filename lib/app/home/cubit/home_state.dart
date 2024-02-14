part of 'home_cubit.dart';

abstract class NavbarState {}

class NavbarInitialState extends NavbarState {}

class NavbarChangeState extends NavbarState {
  final int selectedIndex;

  NavbarChangeState(this.selectedIndex);
}
