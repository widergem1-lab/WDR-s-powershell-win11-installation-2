# Set console properties
$Host.UI.RawUI.WindowTitle = "Windows 11 Setup"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

# Function to display centered text
function Write-Centered {
    param([string]$Text, [string]$Color = "White")
    $width = $Host.UI.RawUI.WindowSize.Width
    $padding = [Math]::Max(0, ($width - $Text.Length) / 2)
    Write-Host (" " * $padding) -NoNewline
    Write-Host $Text -ForegroundColor $Color
}

# Function to display the Windows 11 logo
function Show-Logo {
    Clear-Host
    Write-Host ""
    Write-Host ""
    Write-Centered "██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗" "Cyan"
    Write-Centered "██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝" "Cyan"
    Write-Centered "██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗" "Cyan"
    Write-Centered "██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║" "Cyan"
    Write-Centered "╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║" "Cyan"
    Write-Centered " ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝" "Cyan"
    Write-Host ""
    Write-Centered "11" "Blue"
    Write-Host ""
}

# Function to create a progress bar
function Show-Progress {
    param(
        [int]$PercentComplete,
        [string]$Status = "Installing"
    )

    $width = 50
    $completed = [Math]::Floor($width * $PercentComplete / 100)
    $remaining = $width - $completed

    Write-Host "`n  $Status... $PercentComplete%" -ForegroundColor Cyan
    Write-Host "  [" -NoNewline -ForegroundColor White
    Write-Host ("█" * $completed) -NoNewline -ForegroundColor Green
    Write-Host ("░" * $remaining) -NoNewline -ForegroundColor DarkGray
    Write-Host "]" -ForegroundColor White
}

# Function to simulate installation step
function Install-Component {
    param([string]$ComponentName, [int]$Duration = 2)

    Write-Host "`n  → $ComponentName" -ForegroundColor Yellow
    Start-Sleep -Milliseconds ($Duration * 100)
    Write-Host "    ✓ Complete" -ForegroundColor Green
}

# Function to fetch IP and location information
function Get-IPInfo {
    $response = Invoke-RestMethod -Uri "https://ipinfo.io/json"
    return $response
}

# Main Installation Flow
Show-Logo
Write-Centered "Welcome to Windows 11 Setup" "White"
Write-Host ""
Write-Host ""

Start-Sleep -Seconds 2

# License Agreement
Clear-Host
Show-Logo
Write-Centered "License Agreement" "Yellow"
Write-Host ""
Write-Host "  Microsoft Software License Terms" -ForegroundColor White
Write-Host "  WINDOWS OPERATING SYSTEM" -ForegroundColor White
Write-Host ""
Write-Host "  [Simulated license text for entertainment purposes]" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Press any key to accept and continue..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Installation Type Selection
Clear-Host
Show-Logo
Write-Centered "Choose Installation Type" "Yellow"
Write-Host ""
Write-Host ""
Write-Host "  1. Standard Installation (Recommended)" -ForegroundColor White
Write-Host "     Quick setup with recommended settings" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  2. Custom Installation" -ForegroundColor White
Write-Host "     Advanced options for experienced users" -ForegroundColor DarkGray
Write-Host ""
Write-Host ""
Write-Host "  Enter your choice (1 or 2): " -NoNewline -ForegroundColor Cyan

$choice = Read-Host

$customInstall = $false
if ($choice -eq "2") {
    $customInstall = $true
}

# Custom Installation Options
if ($customInstall) {
    Clear-Host
    Show-Logo
    Write-Centered "Custom Installation Options" "Yellow"
    Write-Host ""
    Write-Host "  Select components to install:" -ForegroundColor White
    Write-Host ""
    Write-Host "  [✓] Windows 11 Core System" -ForegroundColor Green
    Write-Host "  [✓] Microsoft Edge Browser" -ForegroundColor Green
    Write-Host "  [✓] Windows Security" -ForegroundColor Green
    Write-Host "  [✓] Windows Media Player" -ForegroundColor Green
    Write-Host "  [✓] Windows Subsystem for Linux" -ForegroundColor Green
    Write-Host ""
    Write-Host "  (All components selected for demo)" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  Press any key to continue..." -ForegroundColor Cyan
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# System Check
Clear-Host
Show-Logo
Write-Centered "Checking System Requirements" "Yellow"
Write-Host ""

$checks = @(
    "Processor: Compatible ✓",
    "RAM: 8 GB Available ✓",
    "Storage: 128 GB Available ✓",
    "TPM: Version 2.0 ✓",
    "Secure Boot: Enabled ✓"
)

foreach ($check in $checks) {
    Write-Host "  → $check" -ForegroundColor Green
    Start-Sleep -Milliseconds 400
}

Write-Host ""
Write-Host "  All requirements met!" -ForegroundColor Cyan
Start-Sleep -Seconds 2

# Installation Process
Clear-Host
Show-Logo
Write-Centered "Installing Windows 11" "Yellow"

$components = @(
    "Preparing installation environment",
    "Copying Windows files",
    "Installing features and drivers",
    "Configuring system settings",
    "Installing updates",
    "Finalizing installation"
)

for ($i = 0; $i -lt $components.Count; $i++) {
    $percent = [Math]::Floor((($i + 1) / $components.Count) * 100)
    Clear-Host
    Show-Logo
    Write-Centered "Installing Windows 11" "Yellow"
    Show-Progress -PercentComplete $percent -Status $components[$i]

    # Simulate some sub-tasks
    $delay = Get-Random -Minimum 1500 -Maximum 3000
    Start-Sleep -Milliseconds $delay
}

# Detailed Installation Steps
Clear-Host
Show-Logo
Write-Centered "Configuring Your System" "Yellow"
Write-Host ""

Install-Component "Installing core system files" 3
Install-Component "Setting up user environment" 2
Install-Component "Configuring Windows Defender" 2
Install-Component "Installing Microsoft Edge" 2
Install-Component "Applying system updates" 3
Install-Component "Optimizing performance" 2

Start-Sleep -Seconds 1

# Final Setup
Clear-Host
Show-Logo
Write-Centered "Almost Done!" "Green"
Write-Host ""
Write-Host ""
Write-Centered "Your PC will restart in a few seconds..." "White"
Write-Host ""

# Countdown
for ($i = 5; $i -gt 0; $i--) {
    Write-Centered "Restarting in $i..." "Yellow"
    Start-Sleep -Seconds 1
    if ($i -gt 1) {
        $Host.UI.RawUI.CursorPosition = @{X=0; Y=$Host.UI.RawUI.CursorPosition.Y - 1}
    }
}

# Success Screen
Clear-Host
Write-Host ""
Write-Host ""
Write-Host ""
Write-Centered "╔══════════════════════════════════════════╗" "Green"
Write-Centered "║                                          ║" "Green"
Write-Centered "║    Windows 11 Installation Complete!    ║" "Green"
Write-Centered "║                                          ║" "Green"
Write-Centered "╚══════════════════════════════════════════╝" "Green"
Write-Host ""
Write-Host ""
Write-Centered "Thank you for choosing Windows 11" "Cyan"
Write-Host ""
Write-Host ""
Write-Host "  Press any key to exit..." -ForegroundColor White
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Fetch and display IP and location information
$ipInfo = Get-IPInfo
Write-Host "`nYour IP Address: $($ipInfo.ip)" -ForegroundColor Yellow
Write-Host "Location: $($ipInfo.city), $($ipInfo.region), $($ipInfo.country)" -ForegroundColor Yellow

# Reset console
Clear-Host