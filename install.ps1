# Claude Code for Everyone - Windows Installer
# This script handles all the technical stuff so you don't have to.

Write-Host ""
Write-Host "========================================" -ForegroundColor Blue
Write-Host "   Claude Code for Everyone Installer   " -ForegroundColor Blue
Write-Host "========================================" -ForegroundColor Blue
Write-Host ""

# Check if running as administrator for Node.js installation
function Test-Admin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Check if Node.js is installed
function Test-NodeInstalled {
    try {
        $nodeVersion = node -v 2>$null
        if ($nodeVersion) {
            Write-Host "[OK] Node.js is already installed ($nodeVersion)" -ForegroundColor Green
            return $true
        }
    } catch {}
    return $false
}

# Check if Claude Code is installed
function Test-ClaudeInstalled {
    try {
        $claudeVersion = claude --version 2>$null
        if ($claudeVersion) {
            return $true
        }
    } catch {}
    return $false
}

# Install Node.js using winget or direct download
function Install-NodeJS {
    Write-Host "[...] Installing Node.js..." -ForegroundColor Yellow

    # Try winget first (Windows 11 and newer Windows 10)
    try {
        $wingetExists = Get-Command winget -ErrorAction SilentlyContinue
        if ($wingetExists) {
            winget install OpenJS.NodeJS.LTS --accept-package-agreements --accept-source-agreements
            Write-Host "[OK] Node.js installed successfully" -ForegroundColor Green
            return $true
        }
    } catch {}

    # Fallback: Direct download
    Write-Host "[...] Downloading Node.js installer..." -ForegroundColor Yellow
    $nodeUrl = "https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi"
    $installerPath = "$env:TEMP\nodejs_installer.msi"

    try {
        Invoke-WebRequest -Uri $nodeUrl -OutFile $installerPath
        Write-Host "[...] Running Node.js installer..." -ForegroundColor Yellow
        Start-Process msiexec.exe -Wait -ArgumentList "/i `"$installerPath`" /quiet"
        Remove-Item $installerPath -Force
        Write-Host "[OK] Node.js installed successfully" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "[ERROR] Could not install Node.js automatically." -ForegroundColor Red
        Write-Host ""
        Write-Host "Please install it manually:" -ForegroundColor Yellow
        Write-Host "1. Go to https://nodejs.org"
        Write-Host "2. Download the LTS version"
        Write-Host "3. Run the installer"
        Write-Host "4. Run this script again"
        return $false
    }
}

# Install Claude Code
function Install-ClaudeCode {
    Write-Host "[...] Installing Claude Code..." -ForegroundColor Yellow

    # Refresh PATH to pick up newly installed Node.js
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

    try {
        npm install -g @anthropic-ai/claude-code
        Write-Host "[OK] Claude Code installed successfully" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "[ERROR] Failed to install Claude Code" -ForegroundColor Red
        return $false
    }
}

# Main installation
function Main {
    # Step 1: Check/Install Node.js
    if (-not (Test-NodeInstalled)) {
        if (-not (Install-NodeJS)) {
            exit 1
        }
    }

    # Step 2: Install Claude Code
    if (-not (Test-ClaudeInstalled)) {
        if (-not (Install-ClaudeCode)) {
            exit 1
        }
    } else {
        Write-Host "[OK] Claude Code is already installed" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   Installation Complete!               " -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "To start Claude Code:"
    Write-Host ""
    Write-Host "1. Close this window"
    Write-Host "2. Open a NEW Terminal or PowerShell"
    Write-Host "3. Type: claude"
    Write-Host ""
    Write-Host "The first time you run it, you'll be asked to log in."
    Write-Host "Just follow the instructions on screen."
    Write-Host ""
}

Main
