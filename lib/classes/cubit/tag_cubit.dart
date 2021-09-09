import 'package:calm_mind/classes/classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagCubit extends Cubit<TagEnum> {
  TagCubit() : super(TagEnum.none);

  void select(final TagEnum tagEnum) {
    emit(tagEnum);
  }
}
