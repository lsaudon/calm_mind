import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ClassesBloc', () {
    late ClassesRepository classesRepository;

    setUp(() {
      classesRepository = MockClassesRepository();
    });

    test('initial state is ClassesLoading', () {
      expect(ClassesBloc(tagCubit: TagCubit(), classesRepository: classesRepository).state.runtimeType,
          equals(ClassesLoading));
    });

    blocTest<ClassesBloc, ClassesState>(
      'emits [LoadClasses(TagEnum.none)] when increment is called',
      build: () => ClassesBloc(tagCubit: TagCubit(), classesRepository: classesRepository),
      act: (bloc) {
        when(() => classesRepository.classes(TagEnum.none)).thenAnswer((_) => Stream.value([
              const Class('Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange)
            ]));
        bloc.add(const LoadClasses(TagEnum.none));
      },
      expect: () => [
        equals(const ClassesLoaded(
            [Class('Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange)]))
      ],
    );
  });
}
