import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TagCubit', () {
    setUp(() {});

    test('initial state is TagEnum.sleeper', () {
      expect(TagCubit().state, TagEnum.sleeper);
    });

    group('select', () {
      blocTest<TagCubit, TagEnum>(
        'emits [TagEnum.innerPeace] when select TagEnum.innerPeace',
        build: () => TagCubit(),
        act: (cubit) => cubit.select(TagEnum.innerPeace),
        expect: () => const <TagEnum>[TagEnum.innerPeace],
      );

      blocTest<TagCubit, TagEnum>(
        'emits [TagEnum.innerPeace] when select twice TagEnum.innerPeace',
        build: () => TagCubit(),
        act: (cubit) {
          cubit.select(TagEnum.innerPeace);
          cubit.select(TagEnum.innerPeace);
        },
        expect: () => const <TagEnum>[TagEnum.innerPeace],
      );

      blocTest<TagCubit, TagEnum>(
        'emits [TagEnum.innerPeace,TagEnum.anxiety] when select TagEnum.innerPeace and TagEnum.anxiety',
        build: () => TagCubit(),
        act: (cubit) {
          cubit.select(TagEnum.innerPeace);
          cubit.select(TagEnum.anxiety);
        },
        expect: () => const <TagEnum>[TagEnum.innerPeace, TagEnum.anxiety],
      );
    });
  });
}
