import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:calm_mind/classes/view/classes_page.dart';
import 'package:calm_mind/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/mocks.dart';
import '../../helpers/pump_app.dart';

void main() {
  group('HomePage', () {
    const pushButtonKey = Key('homeView_push_to_ClassesPage');

    testWidgets('renders HomePage', (final tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.text('CalmDown'), findsOneWidget);
    });

    testWidgets(
      'go to ClassesPage when push Button is tapped',
      (final tester) async {
        final classesRepository = ClassesRepository();
        final navigatorObserver = MockNavigatorObserver();
        await tester.pumpApp(
          const HomePage(),
          navigatorObserver: navigatorObserver,
          classesRepository: classesRepository,
        );
        await tester.tap(find.byKey(pushButtonKey));
        await tester.pumpAndSettle();
        verify(
          () => navigatorObserver.didReplace(
            newRoute: any(named: 'newRoute'),
            oldRoute: any(named: 'oldRoute'),
          ),
        ).called(1);
        expect(find.byType(ClassesPage), findsOneWidget);
      },
    );
  });
}
