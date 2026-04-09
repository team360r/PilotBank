# PilotBank — AI-Assisted Flutter Development Tutorial

**Learn to use AI coding tools effectively by building a real banking app.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.4+-blue.svg)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Tutorial](https://img.shields.io/badge/Tutorial-12_Chapters-indigo.svg)](#chapters)

---

## What is this?

PilotBank is a hands-on Flutter tutorial that teaches you how to work **with** AI coding tools — not just how to use them, but how to use them *well*. You are the **Pilot**. The AI is your **Copilot**. Like any good flight crew, you need to know when to hand over the controls, when to take them back, and when the autopilot is quietly flying you into a mountain.

Over 12 chapters you will build a complete banking app from scratch while learning the essential skills of AI-assisted development: effective prompting, critical evaluation, debugging AI mistakes, writing tests with AI, refactoring, documentation, security awareness, and team adoption strategies.

### The Dual-Path Method

Every chapter offers **two paths** through the same material:

| Path | Who it's for | What you do |
|------|-------------|-------------|
| **Manual Path** | Learners who want deep understanding | Write every line by hand, following step-by-step instructions |
| **AI-Assisted Path** | Learners exploring AI workflows | Use your AI coding tool with guided prompts and evaluation checkpoints |

Both paths build the same app and arrive at the same result. A **Cross-Check** section at the end of each chapter compares the two approaches — what the AI got right, what it missed, and what you should watch for. This is where the real learning happens.

---

## Prerequisites

- [ ] Flutter SDK 3.x+ — [Install Flutter](https://docs.flutter.dev/get-started/install)
- [ ] Node.js 20+ — [nodejs.org](https://nodejs.org) — for the tutorial guide
- [ ] An AI coding tool (GitHub Copilot, Cursor, Claude Code, Cody, or similar)
- [ ] VS Code or Android Studio
- [ ] An iOS device/simulator or Android device/emulator
- [ ] Basic Flutter knowledge (built at least one app)

---

## Quick Start

```bash
git clone <repo-url>
cd PilotBank
./setup.sh
```

`setup.sh` installs Flutter dependencies and the tutorial docs site.

Then start the tutorial:

```bash
./start.sh
```

This opens the tutorial guide at `http://localhost:3000`. In a second terminal, run the Flutter app:

```bash
flutter run
```

Finally, open the project in your IDE:

```bash
code .              # VS Code
# or open the PilotBank/ folder in Android Studio
```

---

## How This Tutorial Works

This tutorial uses a three-panel workflow:

| Panel | What's Here |
|-------|-------------|
| **Browser** | Tutorial guide at `localhost:3000` — instructions, prompts, cross-checks, and explanations |
| **IDE** | VS Code or Android Studio — where you (and your AI copilot) edit Flutter code |
| **Device** | Your connected iPhone/simulator or Android phone/emulator with hot reload |

Each chapter introduces an **AI Skill** (the thing you are learning to do with AI) and names a specific **Anti-Pattern** (the common mistake developers make). The aviation metaphor keeps things memorable: each anti-pattern is a named hazard you learn to recognise and avoid.

---

## Chapters

| # | Title | AI Skill | Anti-Pattern | Time |
|---|-------|----------|-------------|------|
| 0 | Pre-Flight Checklist | Tool setup | "Ghost Copilot" | ~20 min |
| 1 | Filing Your Flight Plan | Effective prompting | "Fly-by-Night" | ~25 min |
| 2 | Instrument Scan | Critical evaluation | "Autopilot Complacency" | ~30 min |
| 3 | Takeoff | AI for boilerplate | "Backseat Driver" | ~30 min |
| 4 | Cruise Altitude | AI for UI from specs | "Armchair Architect" | ~35 min |
| 5 | Turbulence | Debugging AI mistakes | "False Horizon" | ~30 min |
| 6 | Holding Pattern | AI for test writing | "Rubber Stamp" | ~30 min |
| 7 | Go-Around | AI for refactoring | "Lost in the Clouds" | ~25 min |
| 8 | Radio Calls | AI for documentation | "Radio Silence" | ~20 min |
| 9 | Mayday Protocol | Security & IP risks | "Open Cockpit" | ~25 min |
| 10 | Crew Resource Management | Team adoption | "Solo Pilot" | ~25 min |
| 11 | Landing | Ship it with AI | "Crash Landing" | ~20 min |

**Total estimated time: ~5 hours**

---

## Chapter Branches

Every chapter has a matching git branch containing the app exactly as it should look after completing that chapter. The branches build incrementally:

| Branch | What it contains |
|--------|-----------------|
| `main` | Starter project — clean scaffold, ready for Chapter 0 |
| `chapter-0-preflight` | + Tool configuration, environment verification |
| `chapter-1-flight-plan` | + First AI-generated code, prompt engineering basics |
| `chapter-2-instrument-scan` | + Evaluated and corrected AI output, review patterns |
| `chapter-3-takeoff` | + Models, database layer, boilerplate via AI |
| `chapter-4-cruise` | + UI screens built from specs with AI assistance |
| `chapter-5-turbulence` | + Debugged AI mistakes, error handling |
| `chapter-6-holding-pattern` | + Test suite written with AI, test patterns |
| `chapter-7-go-around` | + Refactored architecture, AI-assisted cleanup |
| `chapter-8-radio-calls` | + Documentation, comments, API docs |
| `chapter-9-mayday` | + Security audit, dependency review, IP checks |
| `chapter-10-crm` | + Team workflow configuration, guidelines |
| `chapter-11-landing` | + Release preparation, CI/CD, final polish |
| `completed` | The finished app with all chapters applied |

**Usage:**

```bash
# Jump to a specific chapter's starting point
git checkout chapter-3-takeoff

# Compare your work with the expected result
git diff chapter-4-cruise

# Reset to a clean state for any chapter
git checkout chapter-0-preflight
```

---

## Project Structure

```
PilotBank/
├── lib/
│   ├── main.dart              # App entry point
│   ├── app.dart               # Root MaterialApp widget
│   ├── theme/                 # Indigo theme (AppColors, AppTheme)
│   ├── data/                  # Database, models, repositories (Ch 3+)
│   ├── providers/             # Riverpod providers (Ch 3+)
│   ├── routing/               # GoRouter configuration (Ch 4+)
│   ├── screens/               # Full-page screen widgets (Ch 4+)
│   └── widgets/               # Reusable UI components (Ch 4+)
├── test/                      # Widget and unit tests (Ch 6+)
├── docs-site/                 # Docusaurus tutorial guide
├── setup.sh                   # One-time project setup
├── start.sh                   # Launch tutorial docs server
└── pubspec.yaml               # Flutter dependencies
```

---

## What Makes PilotBank Different?

### Tool-Agnostic

PilotBank does not assume you use a specific AI tool. The AI-Assisted path provides **prompts and evaluation criteria** that work with GitHub Copilot, Cursor, Claude Code, Cody, ChatGPT, or any other AI coding assistant. The skill is in how you interact with the AI, not which AI you use.

### Anti-Pattern Naming

Each chapter names a specific anti-pattern with a memorable aviation callsign. "Autopilot Complacency" is easier to remember (and call out in code review) than "the tendency to accept AI-generated code without critical evaluation." The names stick because the metaphor works.

### Team-Focused

Chapter 10 (Crew Resource Management) is dedicated to team adoption — how to introduce AI tools to a development team, establish guidelines, handle code review of AI-generated code, and avoid the "Solo Pilot" pattern where one person uses AI and the rest of the team cannot maintain the code.

### Cross-Check Pedagogy

The Manual and AI-Assisted paths are not alternatives — they are complementary. The Cross-Check section in each chapter shows you what the AI got right, what it got wrong, and why. This builds the critical evaluation skill that separates effective AI users from developers who just accept whatever the tool produces.

---

## Related Tutorials

PilotBank is part of the *Bank tutorial series. Each tutorial teaches a different aspect of Flutter development through the same banking app concept:

| Tutorial | Focus | Status |
|----------|-------|--------|
| **PilotBank** | AI-assisted development | This tutorial |
| [AccessBank](https://github.com/user/AccessBank) | Accessibility (a11y) | Available |
| [WebBank](https://github.com/user/WebBank) | Web-specific Flutter | Planned |
| [CoreBank](https://github.com/user/CoreBank) | Core Flutter patterns | Planned |
| [SecureBank](https://github.com/user/SecureBank) | Security best practices | Planned |
| [CheckBank](https://github.com/user/CheckBank) | Testing & QA | Planned |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.x + Dart 3.4+ |
| State Management | Riverpod 2.x |
| Routing | GoRouter 14.x |
| Database | Drift (SQLite) |
| Fonts | Google Fonts |
| Tutorial Docs | Docusaurus 3.x |
| Theme | Material 3, Indigo seed color |

---

## Troubleshooting

### `flutter pub get` fails

Make sure you have Flutter 3.22+ installed:

```bash
flutter --version
flutter upgrade
```

### Tutorial site won't start

Check Node.js version (20+ required):

```bash
node --version
npm --version
```

If `docs-site/` doesn't exist yet, you may be on the `main` branch before the docs site is added. The docs site is created in a later setup step.

### iOS build fails

```bash
cd ios
pod install
cd ..
flutter clean
flutter pub get
```

### Android build fails

Ensure your Android SDK is up to date:

```bash
flutter doctor
```

Follow any recommendations from `flutter doctor` to resolve SDK or toolchain issues.

### Hot reload not working

Make sure you are running the app with `flutter run` (not `flutter build`). Hot reload works with `r` in the terminal or the IDE reload button.

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-improvement`)
3. Commit your changes
4. Push to your branch
5. Open a Pull Request

For bug reports or tutorial feedback, please open an issue.

---

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
