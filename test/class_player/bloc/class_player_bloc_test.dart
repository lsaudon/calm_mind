import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/class_player/bloc/class_player_bloc.dart';
import 'package:calm_mind/class_player/bloc/class_player_event.dart';
import 'package:calm_mind/class_player/bloc/class_player_state.dart';
import 'package:calm_mind/class_player/models/class_for_player.dart';
import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClassPlayerBloc', () {
    late ClassId classId;

    setUp(() {
      classId = ClassId.init();
    });

    test('initial state is ClassPlayerInitial', () {
      expect(ClassPlayerBloc().state.runtimeType, ClassPlayerInitial);
    });

    blocTest<ClassPlayerBloc, ClassPlayerState>(
      'emits [LoadClasses(TagEnum.none)] when increment is called',
      build: ClassPlayerBloc.new,
      act: (final bloc) {
        bloc.add(ClassPlayerSelected(classId));
      },
      expect: () => [
        ClassPlayerLoadInProgress(),
        ClassPlayerLoadSuccess(
          ClassForPlayer(
            classId,
            'Zen Meditation',
            'url',
            TagEnum.innerPeace,
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
        ),
      ],
    );
  });
}
