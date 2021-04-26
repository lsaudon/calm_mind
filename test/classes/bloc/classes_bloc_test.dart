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
      expect(ClassesBloc(tagCubit: TagCubit(), classesRepository: _classesRepository).state.runtimeType,
          equals(ClassesInitial));
    });

    blocTest<ClassesBloc, ClassesState>(
      'emits [LoadClasses(TagEnum.none)] when increment is called',
      build: () => ClassesBloc(tagCubit: TagCubit(), classesRepository: _classesRepository),
      act: (bloc) {
        when(() => _classesRepository.classes(TagEnum.none)).thenAnswer((_) => Stream.value([
              Class(_classId, 'Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment,
                  CalmMindColors.orange)
            ]));
        bloc.add(const ClassesLoaded(TagEnum.none));
      },
      expect: () => [
        equals(ClassesLoadSuccess([
          Class(_classId, 'Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange)
        ]))
      ],
    );
  });
}
