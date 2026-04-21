$RootDir = $PSScriptRoot

function Check-Dependencies {
    param(
        [string]$Name,
        [string[]]$Dependencies
    )

    Write-Host "Checking dependencies for $Name"

    foreach ($dep in $Dependencies) {
        if (-not (Get-Command $dep -ErrorAction SilentlyContinue)) {
            Write-Warning "$dep is not installed or not on PATH."
        }
    }
}

function Get-SymlinkStatus {
    param(
        [string]$LinkPath,
        [string]$TargetPath
    )

    $existing = Get-Item $LinkPath -ErrorAction SilentlyContinue

    if (-not $existing) {
        return "Missing"
    }

    if ($existing.LinkType -ne "SymbolicLink") {
        return "NotASymlink"
    }

    if ($existing.Target -ne $TargetPath) {
        return "WrongTarget"
    }

    return "OK"
}

function Symlink-Path {
    param(
        [string]$Name,
        [string]$LinkPath,
        [string]$TargetPath
    )

    switch (Get-SymlinkStatus -LinkPath $LinkPath -TargetPath $TargetPath) {
        "OK"           { Write-Host "$Name config already linked correctly, skipping"; return }
        "WrongTarget"  { Write-Warning "$Name symlink exists but points to the wrong target, skipping" ; return }
        "NotASymlink"  { Write-Error "$Name path exists but is not a symlink, skipping"; return }
        "Missing"      { Write-Host "Linking config for $Name..." }
    }

    if (-not (Test-Path $TargetPath)) {
        Write-Error "Config target path '$TargetPath' does not exist"
        return
    }

    try {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath -Force -ErrorAction Stop | Out-Null
        Write-Host "Installed $Name config to $LinkPath"
    } catch {
        Write-Error "Failed to create symlink`: $_"
    }
}

#############################
##  Install Neovim Config  ##
#############################
Write-Host "`n========= Neovim ========"
Check-Dependencies -Name "Neovim" `
                   -Dependencies "nvim", "git", "rg", "lazygit", "npm", "tree-sitter"

Symlink-Path -Name "Neovim" `
             -LinkPath "$env:LOCALAPPDATA\nvim" `
             -TargetPath "$RootDir\config\neovim"

##########################
##  Install .gitconfig  ##
##########################
Write-Host "`n========== Git =========="
Check-Dependencies -Name "Git" `
                   -Dependencies "git", "vim"

$gitConfigInstall = Join-Path $PSScriptRoot "config" "git" "setup_config.ps1"
& $gitConfigInstall
