import 'dart:ui';

import 'package:calm_mind/classes/models/class_id.dart';
import 'package:equatable/equatable.dart';

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
