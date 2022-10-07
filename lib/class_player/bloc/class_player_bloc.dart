import 'package:bloc/bloc.dart';
import 'package:calm_mind/class_player/bloc/class_player_event.dart';
import 'package:calm_mind/class_player/bloc/class_player_state.dart';
import 'package:calm_mind/class_player/models/class_for_player.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';

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
