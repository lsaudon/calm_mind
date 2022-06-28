import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
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
