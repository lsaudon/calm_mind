import 'dart:ui';

import 'package:calm_mind/classes/models/class_id.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:equatable/equatable.dart';

class ClassForPlayer extends Equatable {
  const ClassForPlayer(
    this.id,
    this.label,
    this.path,
    this.tag,
    this.imageName,
    this.color,
  );

  final ClassId id;
  final String label;
  final TagEnum tag;
  final String path;
  final String imageName;
  final Color color;

  @override
  List<Object?> get props => [
        id,
        label,
        tag,
        path,
        imageName,
        color,
      ];
}
