import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ClassesBloc', () {
    late ClassesRepository classesRepository;
    late ClassId classId;

    setUp(() {
      classesRepository = MockClassesRepository();
      classId = ClassId.init();
    });

    test('initial state is ClassesInitial', () {
      expect(
        ClassesBloc(tagCubit: TagCubit(), classesRepository: classesRepository)
            .state
            .runtimeType,
        ClassesInitial,
      );
    });

    blocTest<ClassesBloc, ClassesState>(
      'emits [ClassesLoadSuccess(ClassForTeam)] when ClassesLoaded(TagEnum.none) is called',
      build: () => ClassesBloc(
        tagCubit: TagCubit(),
        classesRepository: classesRepository,
      ),
      act: (final bloc) {
        when(() => classesRepository.classes(TagEnum.none)).thenAnswer(
          (final _) => Stream.value([
            ClassForList(
              classId,
              'Zen Meditation',
              '20 min',
              CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange,
            )
          ]),
        );
        bloc.add(const ClassesLoaded(TagEnum.none));
      },
      expect: () => [
        ClassesLoadSuccess(
          [
            ClassForList(
              classId,
              'Zen Meditation',
              '20 min',
              CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange,
            )
          ],
        ),
      ],
    );
  });
}
