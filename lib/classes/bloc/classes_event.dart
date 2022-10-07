import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:equatable/equatable.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();

  @override
  List<Object> get props => [];
}

class ClassesLoaded extends ClassesEvent {
  const ClassesLoaded(this.tagEnum);

  final TagEnum tagEnum;

  @override
  List<Object> get props => [tagEnum];
}

class ClassesUpdated extends ClassesEvent {
  const ClassesUpdated(this.classes);

  final List<ClassForList> classes;

  @override
  List<Object> get props => [classes];
}
