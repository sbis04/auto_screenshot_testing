import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screenshots/screenshots.dart';

// The application under test.
import 'package:auto_screenshot_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final config = Config();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button; verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Finds the floating action button to tap on.
      final Finder fab = find.byTooltip('Increment');

      // Emulate a tap on the floating action button.
      await tester.tap(fab);
      await screenshot(tester, config, 'hello');

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
