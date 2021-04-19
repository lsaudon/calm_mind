import 'package:calm_mind/classes/classes.dart';
import 'package:equatable/equatable.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesLoading extends ClassesState {}

class ClassesLoaded extends ClassesState {
  const ClassesLoaded([this.classes = const []]);

  final List<Class> classes;

  @override
  List<Object> get props => [classes];

  @override
  String toString() => 'ClassesLoaded { classes: $classes }';
}
