$settingsFile = $env:LOCALAPPDATA + "\SumatraPDF\SumatraPDF-settings.txt"

$settings = [System.IO.File]::ReadAllText($settingsFile)

if ($settings.Contains("TextColor = #000000") -and $settings.Contains("BackgroundColor = #ffffff"))
{
	$settings = $settings.Replace("TextColor = #000000","TextColor = #eeeeee")
	$settings = $settings.Replace("BackgroundColor = #ffffff","BackgroundColor = #111111")
	if (!($settings.Contains("GradientColors")))
	{
		$settings = $settings.Replace("HideScrollbars = false","HideScrollbars = false`n`tGradientColors = #000000")
	}
}
elseif ($settings.Contains("TextColor = #eeeeee") -and $settings.Contains("BackgroundColor = #111111") -and $settings.Contains("GradientColors = #000000"))
{
	$settings = $settings.Replace("TextColor = #eeeeee","TextColor = #000000")
	$settings = $settings.Replace("BackgroundColor = #111111","BackgroundColor = #ffffff")
	$settings = $settings.Replace("HideScrollbars = false`n`tGradientColors = #000000","HideScrollbars = false")
}
else
{
	Write-Host "Incorrect configuration. Proceed manually."
	exit
}

[System.IO.File]::WriteAllText($settingsFile, $settings)
