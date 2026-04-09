---
sidebar_position: 1
slug: /intro
title: Introduction
description: "Welcome to PilotBank — learn AI-assisted Flutter development with the Dual-Path method."
---

# Introduction

**PilotBank** is a hands-on Flutter tutorial that teaches you to work effectively with AI coding assistants. The central metaphor is simple: you are the **Pilot in Command**. AI is your copilot. You decide when to hand over the controls and when to take them back.

Over 12 chapters and roughly 5 hours, you will build a banking app from scratch — sometimes writing code by hand, sometimes delegating to AI, and always comparing the results.

## Who this is for

You are a Flutter developer on a team where some people use AI tools heavily, some avoid them, and most are somewhere in the middle. You know widgets, state management, and navigation. You do **not** need prior experience with AI coding tools — that is what this tutorial teaches.

## Prerequisites

- Flutter SDK 3.22+ and working Flutter development experience
- Node.js 20+ (for the tutorial site)
- A device or emulator (iOS, Android, or Chrome for Flutter Web)
- An IDE — VS Code or Android Studio
- **At least one AI coding assistant** installed (GitHub Copilot, Claude Code, Cursor, Codeium, or similar). The tutorial is tool-agnostic — pick whichever you have access to.

## The Dual-Path Method

Every exercise in this tutorial is completed **three ways**:

1. **Manual** — Write the code entirely by hand, the traditional way.
2. **AI-Assisted** — Use your AI tool to generate or assist with the same task.
3. **Cross-Check** — Compare the two approaches. What did the AI get right? What did it miss? When was delegation faster, and when did it introduce risk?

This structure builds calibrated trust. You learn not just *how* to use AI tools, but *when* they help and *when* they hurt.

## How chapter branches work

Every chapter has a matching git branch that contains PilotBank exactly as it should look after completing that chapter. The branches build incrementally.

```bash
# See the finished code for any chapter
git checkout chapter-3-takeoff

# Compare your work against the solution
git diff chapter-3-takeoff -- lib/

# Go back to where you were
git checkout main
```

:::tip
You do not need to use the branches at all if you are following along — they are a safety net, not a requirement.
:::

## Anti-patterns

Each chapter names a specific **anti-pattern** — a common way developers misuse AI tools. By the end of the tutorial, you will have a vocabulary for recognising and avoiding all twelve:

| Chapter | Anti-Pattern | What It Means |
|---------|-------------|---------------|
| 0 | Ghost Copilot | AI is installed but never configured or used |
| 1 | Fly-by-Night | Prompts are vague, unstructured, and produce poor results |
| 2 | Autopilot Complacency | AI output is accepted without reading or evaluating it |
| 3 | Backseat Driver | Micro-managing the AI instead of letting it handle boilerplate |
| 4 | Armchair Architect | Relying on AI for design decisions it cannot make well |
| 5 | False Horizon | Trusting confident-sounding AI output that is subtly wrong |
| 6 | Rubber Stamp | AI-generated tests that pass but do not actually test anything |
| 7 | Lost in the Clouds | Over-refactoring with AI until the code is unrecognisable |
| 8 | Radio Silence | Never using AI for documentation, messages, or communication |
| 9 | Open Cockpit | Ignoring security and IP risks of AI-generated code |
| 10 | Solo Pilot | Using AI tools individually without team standards |
| 11 | Crash Landing | Skipping CI, review, and retrospective in AI-heavy workflows |

## Related tutorials

PilotBank is part of the **\*Bank tutorial series**, each focusing on a different aspect of Flutter development:

- **AccessBank** — Accessibility and inclusive design
- **WebBank** — Responsive web and PWA development
- **CoreBank** — Core Flutter fundamentals and architecture
- **SecureBank** — Mobile security and OWASP hardening
- **CheckBank** — Testing strategies and quality assurance

## Quick Start

```bash
git clone git@github.com:team360r/PilotBank.git
cd PilotBank
./setup.sh
./start.sh
```

Then head to [Chapter 0: Pre-Flight Checklist](/chapters/preflight).
