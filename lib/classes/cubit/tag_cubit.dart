import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calm_mind/classes/classes.dart';

class TagCubit extends Cubit<TagEnum> {
  TagCubit() : super(TagEnum.none);

  void select(TagEnum tagEnum) {
    emit(tagEnum);
  }
}
