import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    const pushButtonKey = Key('homeView_push_to_ClassesPage');

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpApp(const HomePage());
      expect(find.text('CalmDown'), findsOneWidget);
    });

    testWidgets('go to ClassesPage when push Button is tapped', (tester) async {
      final classesRepository = ClassesRepository();
      await tester.pumpApp(const HomePage(), classesRepository: classesRepository);
      await tester.tap(find.byKey(pushButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(ClassesPage), findsOneWidget);
    });
  });
}
