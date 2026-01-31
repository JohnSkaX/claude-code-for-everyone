# Project: Claude Code for Everyone

## Purpose
A zero-friction installer and guide for non-technical users to use Claude Code.

## Core Philosophy
- **Hide all technical complexity** - Users should never see npm, Node.js, or terminal commands beyond the initial install line
- **One-line installation** - Copy, paste, done
- **Plain language only** - No jargon, no assumptions about prior knowledge

## Target Audience
Complete beginners who may feel anxious about anything "technical."
Example: Someone's spouse who has never used a terminal before.

## Project Structure
```
├── README.md          # Two-step quick start
├── install.sh         # Mac/Linux installer (handles everything)
├── install.ps1        # Windows PowerShell installer
├── CLAUDE.md          # This file
└── docs/
    ├── troubleshooting.md  # Common problems, plain-English solutions
    └── examples.md         # Copy-paste prompts to try
```

## Writing Guidelines
- Maximum simplicity
- No technical terms without explanation
- Visual instructions when possible (keyboard shortcuts, button names)
- Reassuring tone - mistakes are okay, nothing will break permanently

## Installer Goals
The install scripts should:
1. Detect the operating system
2. Install Node.js silently if missing
3. Install Claude Code
4. Create simple shortcuts (like `ai` command)
5. Give clear success/failure messages
6. Never require user to understand what's happening "under the hood"
