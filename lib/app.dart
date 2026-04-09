import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class PilotBankApp extends StatelessWidget {
  const PilotBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PilotBank',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const _WelcomeScreen(),
    );
  }
}

class _WelcomeScreen extends StatelessWidget {
  const _WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight_takeoff, size: 80, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 24),
            Text('PilotBank', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Your AI copilot is ready for takeoff.', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            const SizedBox(height: 48),
            Text('Start Chapter 0 in the tutorial to begin building.', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
