import 'package:calm_mind/class_player/class_player.dart';
import 'package:equatable/equatable.dart';

abstract class ClassPlayerState extends Equatable {
  const ClassPlayerState();

  @override
  List<Object> get props => [];
}

class ClassPlayerInitial extends ClassPlayerState {}

class ClassPlayerLoadInProgress extends ClassPlayerState {}

class ClassPlayerLoadSuccess extends ClassPlayerState {
  const ClassPlayerLoadSuccess(this.value);

  final ClassForPlayer value;

  @override
  List<Object> get props => [value];
}
