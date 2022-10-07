import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagCubit extends Cubit<TagEnum> {
  TagCubit() : super(TagEnum.none);

  void select(final TagEnum tagEnum) {
    emit(tagEnum);
  }
}
