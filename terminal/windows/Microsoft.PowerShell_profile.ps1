# Executar o comando echo $profile e verificar qual o caminho que será retornado;
# Pode ser que a pasta PowerShell não existe no caminho retornado. Se for o caso, crie-a;
# Verificar qual a pasta de temas do oh-my-posh: echo $env:POSH_THEMES_PATH
# Copiar o arquivo de config do oh-my-posh para esta pasta
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bruno.v2.omp.json" | Invoke-Expression

# Instalar o módulo terminal icons (https://www.powershellgallery.com/packages/Terminal-Icons/0.9.0)
# Install-Module -Name Terminal-Icons
Import-Module -Name Terminal-Icons

# Instalar o módulo PSReadLine
# Install-Module -Name PSReadLine -RequiredVersion 2.2.2
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Instalar o módulo z
# Install-Module -Name z -Force
Import-Module -Name z -Force

# Instalar o fzf 
# choco install fzf
# Instalar o módulo PSFzf
# Install-Module -Name PSFzf -Scope CurrentUser -Force
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Instalar o posh-git (Auto complete para comandos do git)
# Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
		Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Clear-LocalBranches {
	git fetch --prune
	git checkout master
	$localBranches = git branch --format="%(refname:short)"
	$remoteBranches = git branch -r --format="%(refname:short)"
	
	foreach($branch in $localBranches){
		$localBranchWithOriginPrefix = "origin/$branch"

		if (-not($remoteBranches -contains $localBranchWithOriginPrefix)) {
			git branch -D $branch
		}
	}
	Write-Host "Local branches not in remote have been removed."
}
Set-Alias -Name clear-local-branches -Value Clear-LocalBranches