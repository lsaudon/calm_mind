import 'dart:ui';

import 'package:equatable/equatable.dart';

class Class extends Equatable {
  const Class(this.label, this.timeLabel, this.imageName, this.color);

  final String label;
  final String timeLabel;
  final String imageName;
  final Color color;

  @override
  List<Object?> get props => [
        label,
        timeLabel,
        imageName,
        color,
      ];
}
