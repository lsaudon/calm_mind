import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ClassesBloc', () {
    late ClassesRepository _classesRepository;
    late ClassId _classId;

    setUp(() {
      _classesRepository = MockClassesRepository();
      _classId = ClassId.init();
    });

    test('initial state is ClassesInitial', () {
      expect(
          ClassesBloc(tagCubit: TagCubit(), classesRepository: _classesRepository).state.runtimeType, ClassesInitial);
    });

    blocTest<ClassesBloc, ClassesState>(
      'emits [ClassesLoadSuccess(ClassForTeam)] when ClassesLoaded(TagEnum.none) is called',
      build: () => ClassesBloc(tagCubit: TagCubit(), classesRepository: _classesRepository),
      act: (bloc) {
        when(() => _classesRepository.classes(TagEnum.none)).thenAnswer((_) => Stream.value([
              ClassForList(_classId, 'Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment,
                  CalmMindColors.orange)
            ]));
        bloc.add(const ClassesLoaded(TagEnum.none));
      },
      expect: () => [
        ClassesLoadSuccess(
          [
            ClassForList(
                _classId, 'Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange)
          ],
        ),
      ],
    );
  });
}
