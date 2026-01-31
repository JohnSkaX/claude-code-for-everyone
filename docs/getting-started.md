# Getting Started with Claude Code

This guide will help you install Claude Code and run it for the first time.

## Prerequisites

Before you begin, you'll need:
- A computer (Mac, Windows, or Linux)
- An internet connection
- About 15 minutes of time

## Step 1: Install Node.js

Claude Code runs on Node.js. Think of Node.js as an engine that powers Claude Code.

### On Mac
1. Open Terminal (press Cmd + Space, type "Terminal", press Enter)
2. Install Homebrew (a tool installer) by pasting this command and pressing Enter:
   ```
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Install Node.js:
   ```
   brew install node
   ```

### On Windows
1. Go to https://nodejs.org
2. Download the "LTS" version (the button on the left)
3. Run the installer, click "Next" through all the steps

### On Linux
```
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## Step 2: Install Claude Code

Open your terminal and run:
```
npm install -g @anthropic-ai/claude-code
```

This downloads and installs Claude Code on your computer.

## Step 3: Start Claude Code

In your terminal, type:
```
claude
```

The first time you run it, you'll be asked to log in with your Anthropic account.

## What You Should See

After logging in, you'll see a prompt that looks something like:
```
claude>
```

This means Claude is ready and waiting for your instructions!

## Your First Conversation

Try typing:
```
Hello, can you help me understand what you can do?
```

Claude will respond and explain its capabilities.

## What Could Go Wrong

| Problem | Solution |
|---------|----------|
| "command not found: node" | Node.js isn't installed. Go back to Step 1. |
| "command not found: claude" | Try closing and reopening your terminal. |
| "Permission denied" | On Mac/Linux, add `sudo` before the npm command. |

## Next Steps

Now that Claude Code is running, continue to [Your First Project](first-project.md) to build something!
