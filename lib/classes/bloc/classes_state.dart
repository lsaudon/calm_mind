import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:equatable/equatable.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesInitial extends ClassesState {}

class ClassesLoadInProgress extends ClassesState {}

class ClassesLoadSuccess extends ClassesState {
  const ClassesLoadSuccess([this.classes = const []]);

  final List<ClassForList> classes;

  @override
  List<Object> get props => [classes];

  @override
  String toString() => 'ClassesLoadSuccess { classes: $classes }';
}
