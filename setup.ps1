function CopyConfig
{
    Copy-Item ".\windows\alacritty" "$env:APPDATA\." -Recurse -Force
}
CopyConfig
