import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';

class ClassPlayerBloc extends Bloc<ClassPlayerEvent, ClassPlayerState> {
  ClassPlayerBloc() : super(ClassPlayerInitial());

  @override
  Stream<ClassPlayerState> mapEventToState(ClassPlayerEvent event) async* {
    if (event is ClassPlayerSelected) {
      yield* _mapClassPlayerSelectedToState(event);
    }
  }

  Stream<ClassPlayerState> _mapClassPlayerSelectedToState(ClassPlayerSelected event) async* {
    yield ClassPlayerLoadInProgress();
    final classForPlayer = ClassForPlayer(
      event.classId,
      'Zen Meditation',
      'url',
      TagEnum.innerPeace,
      CalmMindImages.smallHappinessEntertainment,
      CalmMindColors.orange,
    );
    yield ClassPlayerLoadSuccess(classForPlayer);
  }
}
