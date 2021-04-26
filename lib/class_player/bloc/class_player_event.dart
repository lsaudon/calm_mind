import 'package:calm_mind/classes/classes.dart';
import 'package:equatable/equatable.dart';

abstract class ClassPlayerEvent extends Equatable {
  const ClassPlayerEvent();

  @override
  List<Object> get props => [];
}

class ClassPlayerSelected extends ClassPlayerEvent {
  const ClassPlayerSelected(this.classId);

  final ClassId classId;

  @override
  List<Object> get props => [classId];
}
