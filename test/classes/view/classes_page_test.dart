import 'package:calm_mind/classes/bloc/classes_bloc.dart';
import 'package:calm_mind/classes/bloc/classes_state.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:calm_mind/classes/view/classes_page.dart';
import 'package:calm_mind/classes/view/classes_view.dart';
import 'package:calm_mind/classes/widgets/tag.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';
import '../../helpers/pump_app.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders ClassesView', (final tester) async {
      await tester.pumpApp(
        RepositoryProvider(
          create: (final context) => ClassesRepository(),
          child: const ClassesPage(),
        ),
      );
      expect(find.byType(ClassesView), findsOneWidget);
    });
  });

  group('ClassesView', () {
    late ClassesBloc classesBloc;

    setUp(() {
      classesBloc = MockClassesBloc();
    });

    testWidgets('renders ClassesInitial', (final tester) async {
      when(() => classesBloc.state).thenReturn(ClassesLoadInProgress());
      await tester.pumpApp(
        BlocProvider(
          create: (final context) => TagCubit(),
          child: BlocProvider.value(
            value: classesBloc,
            child: const ClassesView(),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('renders ClassesInitial', (final tester) async {
      when(() => classesBloc.state).thenReturn(
        ClassesLoadSuccess([
          ClassForList(
            ClassId.init(),
            'Zen Meditation',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
        ]),
      );
      await tester.pumpApp(
        BlocProvider(
          create: (final context) => TagCubit(),
          child: BlocProvider.value(
            value: classesBloc,
            child: const ClassesView(),
          ),
        ),
      );
      expect(find.text('Zen Meditation'), findsOneWidget);
    });

    testWidgets(
      'innerPeace is active when tap on innerPeace',
      (final tester) async {
        when(() => classesBloc.state).thenReturn(const ClassesLoadSuccess());
        await tester.pumpApp(
          BlocProvider(
            create: (final context) => TagCubit(),
            child: BlocProvider.value(
              value: classesBloc,
              child: const ClassesView(),
            ),
          ),
        );
        final tapTagKey = Key('tag_${TagEnum.innerPeace}');
        expect(tester.widget<Tag>(find.byKey(tapTagKey)).active, false);

        await tester.tap(find.byKey(tapTagKey));
        await tester.pumpAndSettle();

        expect(tester.widget<Tag>(find.byKey(tapTagKey)).active, true);
      },
    );
  });
}
