# Set user.name and user.email
$defaultName  = git config --global user.name
$defaultEmail = git config --global user.email

$name  = Read-Host "Name [$defaultName]"
$email = Read-Host "Email [$defaultEmail]"

$name  = if ($name)  { $name }  else { $defaultName }
$email = if ($email) { $email } else { $defaultEmail }

if (-not $name -or -not $email) {
    Write-Error "Name and email are required."
    exit 1
}

git config --global user.name  $name
git config --global user.email $email

# Link custom configs
$existingIncludes = git config --global --get-all include.path

$sharedConfig = Join-Path $PSScriptRoot ".gitconfig"
if ($existingIncludes -notcontains $sharedConfig) {
    git config --global --add include.path $sharedConfig
}

$osConfig = Join-Path $PSScriptRoot ".gitconfig_windows"
if ($existingIncludes -notcontains $osConfig) {
    git config --global --add include.path $osConfig
}

# Set `git bash` alias
$gitExe  = (Get-Command git -ErrorAction SilentlyContinue).Source
if ($gitExe) {
    $gitBash = Join-Path (Split-Path (Split-Path $gitExe)) "bin" "bash.exe"
    if (Test-Path $gitBash) {
        git config --global alias.bash "! `"$gitBash`""
        Write-Host "Git bash alias set to $gitBash"
    } else {
        Write-Warning "Git bash not found at expected path, skipping alias."
    }
} else {
    Write-Warning "Git not found on PATH, skipping bash alias."
}
