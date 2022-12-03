import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class ClassId extends Equatable {
  const ClassId._internal(this.value);

  factory ClassId.init() => ClassId._internal(const Uuid().v4());

  final String value;

  @override
  List<Object?> get props => [value];
}
