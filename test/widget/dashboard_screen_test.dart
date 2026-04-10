import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pilotbank/screens/dashboard_screen.dart';
import 'package:pilotbank/widgets/account_card.dart';

Widget createDashboardScreen() {
  return const ProviderScope(
    child: MaterialApp(
      home: DashboardScreen(),
    ),
  );
}

void main() {
  group('Dashboard screen', () {
    testWidgets('renders greeting with user name', (tester) async {
      await tester.pumpWidget(createDashboardScreen());

      expect(find.textContaining('Welcome back'), findsOneWidget);
      expect(find.textContaining('Alex Johnson'), findsOneWidget);
    });

    testWidgets('renders Your accounts subtitle', (tester) async {
      await tester.pumpWidget(createDashboardScreen());

      expect(find.text('Your accounts'), findsOneWidget);
    });

    testWidgets('displays three account cards', (tester) async {
      await tester.pumpWidget(createDashboardScreen());

      expect(find.byType(AccountCard), findsNWidgets(3));
    });

    testWidgets('shows account names from mock data', (tester) async {
      await tester.pumpWidget(createDashboardScreen());

      expect(find.text('Current Account'), findsOneWidget);
      expect(find.text('Savings Account'), findsOneWidget);
      expect(find.text('Credit Card'), findsOneWidget);
    });

    testWidgets('shows account balances', (tester) async {
      await tester.pumpWidget(createDashboardScreen());

      expect(find.text('£4825.67'), findsOneWidget);
      expect(find.text('£12340.00'), findsOneWidget);
      expect(find.text('£-892.15'), findsOneWidget);
    });
  });
}
