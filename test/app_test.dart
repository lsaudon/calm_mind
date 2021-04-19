import 'package:calm_mind/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calm_mind/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
