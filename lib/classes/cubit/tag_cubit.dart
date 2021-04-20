import 'package:flutter_bloc/flutter_bloc.dart';

enum TagEnum {
  sleeper,
  innerPeace,
  stress,
  anxiety,
}

extension TagEnumExtension on TagEnum {
  String toText() {
    switch (this) {
      case TagEnum.sleeper:
        return 'Sleeper';
      case TagEnum.innerPeace:
        return 'Inner Peace';
      case TagEnum.stress:
        return 'Stress';
      case TagEnum.anxiety:
        return 'Anxiety';
    }
  }
}

class TagCubit extends Cubit<TagEnum> {
  TagCubit() : super(TagEnum.sleeper);

  void select(TagEnum tagEnum) {
    emit(tagEnum);
  }
}
