import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ClassId extends Equatable {
  const ClassId._internal(this.value);

  factory ClassId.init() {
    return ClassId._internal(const Uuid().v4());
  }

  final String value;

  @override
  List<Object?> get props => [value];
}

class ClassForList extends Equatable {
  const ClassForList(
    this.id,
    this.label,
    this.timeLabel,
    this.imageName,
    this.color,
  );

  final ClassId id;
  final String label;
  final String timeLabel;
  final String imageName;
  final Color color;

  @override
  List<Object?> get props => [
        id,
        label,
        timeLabel,
        imageName,
        color,
      ];
}
