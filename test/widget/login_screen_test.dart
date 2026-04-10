import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pilotbank/screens/login_screen.dart';
import 'package:pilotbank/providers/auth_provider.dart';

Widget createLoginScreen({AuthNotifier? authNotifier}) {
  return ProviderScope(
    overrides: [
      if (authNotifier != null)
        authProvider.overrideWith((_) => authNotifier),
    ],
    child: const MaterialApp(
      home: LoginScreen(),
    ),
  );
}

void main() {
  group('Login screen', () {
    testWidgets('renders email and password fields', (tester) async {
      await tester.pumpWidget(createLoginScreen());

      expect(find.text('Email address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('renders sign in button', (tester) async {
      await tester.pumpWidget(createLoginScreen());

      expect(find.text('Sign in'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('renders forgot password button', (tester) async {
      await tester.pumpWidget(createLoginScreen());

      expect(find.text('Forgot password?'), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('shows error message on invalid credentials', (tester) async {
      await tester.pumpWidget(createLoginScreen());

      // Enter wrong credentials
      await tester.enterText(
        find.byType(TextField).first,
        'wrong@email.com',
      );
      await tester.enterText(
        find.byType(TextField).last,
        'wrongpassword',
      );

      // Tap sign in
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();

      // Should display error
      expect(find.text('Invalid email or password'), findsOneWidget);
    });

    testWidgets('clears error when user types after failed login', (tester) async {
      await tester.pumpWidget(createLoginScreen());

      // Trigger an error
      await tester.enterText(find.byType(TextField).first, 'wrong@email.com');
      await tester.enterText(find.byType(TextField).last, 'wrong');
      await tester.tap(find.text('Sign in'));
      await tester.pumpAndSettle();

      // Error should be visible
      expect(find.text('Invalid email or password'), findsOneWidget);

      // Start typing in email field
      await tester.enterText(find.byType(TextField).first, 'a');
      await tester.pumpAndSettle();

      // Error should be cleared
      expect(find.text('Invalid email or password'), findsNothing);
    });
  });
}
