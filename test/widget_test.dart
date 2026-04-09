import 'package:flutter_test/flutter_test.dart';
import 'package:pilotbank/app.dart';

void main() {
  testWidgets('PilotBank app shows welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const PilotBankApp());

    expect(find.text('PilotBank'), findsOneWidget);
    expect(find.text('Your AI copilot is ready for takeoff.'), findsOneWidget);
  });
}
