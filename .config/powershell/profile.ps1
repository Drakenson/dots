Clear-Host
$pwshhostname = $(cat /etc/hostname)
function prompt {
	$ESC = [char]27
	"$ESC[1m$ESC[38;2;104;86;136m" + "PS $pwshhostname@$($env:USER):$ESC[38;2;162;104;87m" + $(Get-Location) + $(if ($NestedPromptLevel -ge 1) { '>>' }) + "$ESC[0m" + '> '
}
