import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  group('CounterPage', () {
    testWidgets('renders ClassesView', (tester) async {
      await tester.pumpApp(RepositoryProvider(
        create: (context) => ClassesRepository(),
        child: const ClassesPage(),
      ));
      expect(find.byType(ClassesView), findsOneWidget);
    });
  });

  group('ClassesView', () {
    late ClassesBloc classesBloc;

    setUpAll(() {
      registerFallbackValue<ClassesEvent>(LoadClasses());
      registerFallbackValue<ClassesState>(ClassesLoading());
    });

    setUp(() {
      classesBloc = MockClassesBloc();
    });

    testWidgets('renders ClassesLoading', (tester) async {
      when(() => classesBloc.state).thenReturn(ClassesLoading());
      await tester.pumpApp(
        BlocProvider.value(
          value: classesBloc,
          child: const ClassesView(),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('renders ClassesLoading', (tester) async {
      when(() => classesBloc.state).thenReturn(
        const ClassesLoaded([
          Class('Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange),
        ]),
      );
      await tester.pumpApp(
        BlocProvider.value(
          value: classesBloc,
          child: const ClassesView(),
        ),
      );
      expect(find.text('Zen Meditation'), findsOneWidget);
    });
  });
}
