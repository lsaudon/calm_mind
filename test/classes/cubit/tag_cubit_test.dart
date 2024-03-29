import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TagCubit', () {
    test('initial state is TagEnum.none', () {
      expect(TagCubit().state, TagEnum.none);
    });

    group('select', () {
      blocTest<TagCubit, TagEnum>(
        'emits [TagEnum.innerPeace] when select TagEnum.innerPeace',
        build: TagCubit.new,
        act: (final cubit) => cubit.select(TagEnum.innerPeace),
        expect: () => const <TagEnum>[TagEnum.innerPeace],
      );

      blocTest<TagCubit, TagEnum>(
        'emits [TagEnum.innerPeace] when select twice TagEnum.innerPeace',
        build: TagCubit.new,
        act: (final cubit) {
          cubit
            ..select(TagEnum.innerPeace)
            ..select(TagEnum.innerPeace);
        },
        expect: () => const <TagEnum>[TagEnum.innerPeace],
      );

      blocTest<TagCubit, TagEnum>(
        '''emits [TagEnum.innerPeace,TagEnum.anxiety] when select TagEnum.innerPeace and TagEnum.anxiety''',
        build: TagCubit.new,
        act: (final cubit) {
          cubit
            ..select(TagEnum.innerPeace)
            ..select(TagEnum.anxiety);
        },
        expect: () => const <TagEnum>[TagEnum.innerPeace, TagEnum.anxiety],
      );
    });
  });
}
