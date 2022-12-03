import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/bloc/classes_bloc.dart';
import 'package:calm_mind/classes/bloc/classes_event.dart';
import 'package:calm_mind/classes/bloc/classes_state.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/class_id.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';

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
      '''emits [ClassesLoadSuccess(ClassForTeam)] when ClassesLoaded(TagEnum.none) is called''',
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
            ),
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
            ),
          ],
        ),
      ],
    );
  });
}
