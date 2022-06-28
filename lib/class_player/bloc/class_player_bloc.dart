import 'package:bloc/bloc.dart';

import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';

class ClassPlayerBloc extends Bloc<ClassPlayerEvent, ClassPlayerState> {
  ClassPlayerBloc() : super(ClassPlayerInitial()) {
    on<ClassPlayerSelected>((final event, final emit) {
      emit(ClassPlayerLoadInProgress());
      final classForPlayer = ClassForPlayer(
        event.classId,
        'Zen Meditation',
        'url',
        TagEnum.innerPeace,
        CalmMindImages.smallHappinessEntertainment,
        CalmMindColors.orange,
      );
      emit(ClassPlayerLoadSuccess(classForPlayer));
    });
  }
}
