import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pilotbank/app.dart';

void main() {
  testWidgets('PilotBank app shows login screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: PilotBankApp(),
      ),
    );
    await tester.pumpAndSettle();

    // After app launches, the login screen should be visible
    expect(find.text('PilotBank'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
  });
}
