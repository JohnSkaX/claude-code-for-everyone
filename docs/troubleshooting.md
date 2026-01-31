# Troubleshooting

Something not working? Find your problem below.

---

## "command not found" when typing claude

**What it means:** Claude Code isn't installed yet, or your terminal needs a refresh.

**Fix:**
1. Close your terminal completely
2. Open a new terminal
3. Try again

Still not working? Run the installer again.

---

## The installer failed

**On Mac/Linux:**
Try running with administrator permissions:
```
curl -fsSL https://raw.githubusercontent.com/JohnSkaX/claude-code-for-everyone/main/install.sh | sudo bash
```

**On Windows:**
1. Right-click on Terminal/PowerShell
2. Select "Run as Administrator"
3. Run the installer again

---

## "Permission denied" error

Your computer is blocking the installation.

**Fix for Mac/Linux:**
```
sudo npm install -g @anthropic-ai/claude-code
```

**Fix for Windows:**
Run Terminal as Administrator (right-click → Run as Administrator)

---

## Claude asks me to log in but I don't have an account

You need an Anthropic account to use Claude Code.

1. Go to [console.anthropic.com](https://console.anthropic.com)
2. Create a free account
3. Run `claude` again and follow the login steps

---

## Everything is too slow

Claude Code requires a decent internet connection. If it's very slow:
- Check your internet connection
- Try again later (servers might be busy)

---

## I made a mistake and something broke

Don't panic! Tell Claude:
```
I made a mistake. Can you undo the last change?
```

or

```
Something is broken. Can you help me fix it?
```

Claude can usually help you recover.

---

## Still stuck?

Describe your problem to Claude:
```
I'm getting this error: [paste the error message]
```

Claude is very good at explaining errors and helping fix them.
