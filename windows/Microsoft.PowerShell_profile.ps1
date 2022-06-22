# Executar o comando echo $profile e verificar qual o caminho que será retornado;
# Pode ser que a pasta PowerShell não existe no caminho retornado. Se for o caso, crie-a;
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bruno.omp.json" | Invoke-Expression

# Instalar o módulo terminal icons (https://www.powershellgallery.com/packages/Terminal-Icons/0.9.0)
# Install-Module -Name Terminal-Icons
Import-Module -Name Terminal-Icons

# Instalar o módulo PSReadLine
# Install-Module -Name PSReadLine -RequiredVersion 2.2.2
Set-PSReadLineOption -PredictionSource History
#Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Instalar o módulo z
# Install-Module -Name z -Force
Import-Module -Name z -Force

# Instalar o módulo Fzf
# Install-Module -Name PSFzf -Scope CurrentUser -Force
# Import-Module PSFzf
# Set-PsFzOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}