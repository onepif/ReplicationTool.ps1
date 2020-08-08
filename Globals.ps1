#--------------------------------------------
# Declare Global Variables and Functions here
#--------------------------------------------

$FLAG_MASK_SOUND	= 1
$FLAG_MASK_RADAR	= 2
$FLAG_MASK_RLI		= 4
$FLAG_MASK_VIDEO	= 8

$MAX_MASK			= 15

$FLAG_CONS = $true
$HASH_CURRENT = @{ }

if (!$Config -or !(Test-Path $Config))
{
	$Config = "$(Split-Path -Path $MyInvocation.MyCommand.Path)\$(($MyInvocation.MyCommand.Name).Split(".")[0]).json"
}

if (Test-Path $Config)
{
	$jsonCFG = Get-Content -Path "$Config" -Raw | ConvertFrom-JSON
}
else
{
	$jsonCFG = '{
		"LANG": "Ru",
		"FLAG_CHECK": 0,
		"PATH_REPLICATION": "/cygdrive/C/Archive",
		"DIR_SOUND": "Sound",
		"DIR_RADAR": "Radar",
		"DIR_RLI": "RLI",
		"DIR_VIDEO": "Capture",
		"FILE_IDX": "channels.idx",
		"FILE_SETT_VIDEO": "settings.xml",
		"FILE_TMP": "replication.tmp",
		"USERNAME": "User",
		"BASE_NAME": "BRO",
		"TIMEOUT_PING": 1,
		
		"REMOVER_AT_START": "False",
		"FLAG_FROM_DATE": "False",
		"FLAG_TO_DATE": "False",
		"LIFETIME": 30,
		
		"HASH_FULL": [
		{
			"NAME": "TEST",
			"IP_ADDRESS": "localhost"
		},
		{
			"NAME": "BRI-1",
			"IP_ADDRESS": "192.168.10.131"
		},
		{
			"NAME": "BRI-2",
			"IP_ADDRESS": "192.168.10.132"
		}
		]
	}' | ConvertFrom-Json
	
	$Config = "$(Split-Path -Path $MyInvocation.MyCommand.Path)\$(($MyInvocation.MyCommand.Name).Split(".")[0]).json"
	Set-Content -Path "$Config" -Value "$($jsonCFG | ConvertTo-JSON)"
}

function Check-Path
{
	param (
		[Parameter(Mandatory = $true)]
		[string]$Path
	)
	
	$var = $null
	foreach ($ix in $Path.Split("\"))
	{
		if (!($ix -match ":$"))
		{
			if ( !(Test-Path $var\$ix))
			{
				New-Item -Path $var -Name $ix -Type Directory -Force *>$null
			}
		}
		$var += "$ix\"
	}
}
function Switch2En
{
	$contextmenustrip1.Items[0].Checked = $false
	$contextmenustrip1.Items[1].Checked = $true
	$jsonCFG.LANG = 'En'
	
	$MainForm.Text = 'Replication Tool'
	$groupbox3.Text = 'Source'
	$groupbox2.Text = 'Date'
	$checkboxToDate.Text = 'To date:'
	$checkboxFromDate.Text = 'From date:'
	$labelLifeTime.Text = 'Life time'
	$groupbox1.Text = 'Type information'
	$checkboxVideo.Text = 'Video'
	$checkboxRadioInfo.Text = 'Radio info'
	$checkboxRadar.Text = 'Radar'
	$checkboxSound.Text = 'Sound'
	$checkboxSetAll.Text = 'Set all'
	$buttonApply.Text = '&Apply'
	$buttonCancel.Text = '&Cancel'
	# $buttonOK.Text = '&OK'
	if ($combobox3.Items.Count -gt 1) { $ComboBox3.Items[$($combobox3.Items.Count - 1)] = "All" }
	$var1 = $ComboBox1.SelectedIndex; $var2 = $ComboBox2.SelectedIndex
	$ComboBox1.Items.Clear(); $ComboBox2.Items.Clear()
	@('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December') | ForEach-Object { [void]$ComboBox1.Items.Add($_); [void]$ComboBox2.Items.Add($_) }
	$ComboBox1.Text = $ComboBox1.Items[$var1]; $ComboBox1.SelectedIndex = $var1
	$ComboBox2.Text = $ComboBox2.Items[$var2]; $ComboBox2.SelectedIndex = $var2
	$contextmenustrip1.Items[3].Text = "Remover"
	
	$statusbar1.Text = "Switch to english language"
}
function Switch2Ru
{
	$RuToolStripMenuItem_Click
	#TODO: Place custom script here
	$contextmenustrip1.Items[0].Checked = $true
	$contextmenustrip1.Items[1].Checked = $false
	$jsonCFG.LANG = 'Ru'
	
	$MainForm.Text = 'Подсистема репликации'
	$groupbox3.Text = 'Источник'
	$groupbox2.Text = 'Дата'
	$checkboxToDate.Text = 'До даты:'
	$checkboxFromDate.Text = 'От даты:'
	$labelLifeTime.Text = 'Время хранения'
	$groupbox1.Text = 'Тип информации'
	$checkboxVideo.Text = 'Видео'
	$checkboxRadioInfo.Text = 'Радиолокационные двнные'
	$checkboxRadar.Text = 'Параметры локаторов'
	$checkboxSound.Text = 'Звук'
	$checkboxSetAll.Text = 'Выбрать усё'
	$buttonApply.Text = '&Применить'
	$buttonCancel.Text = '&Отмена'
	# $buttonOK.Text = '&OK'
	if ($combobox3.Items.Count -gt 1) { $ComboBox3.Items[$($combobox3.Items.Count - 1)] = "Усё" }
	$var1 = $ComboBox1.SelectedIndex; $var2 = $ComboBox2.SelectedIndex
	$ComboBox1.Items.Clear(); $ComboBox2.Items.Clear()
	@('Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь') | ForEach-Object { [void]$ComboBox1.Items.Add($_); [void]$ComboBox2.Items.Add($_) }
	$ComboBox1.Text = $ComboBox1.Items[$var1]; $ComboBox1.SelectedIndex = $var1
	$ComboBox2.Text = $ComboBox2.Items[$var2]; $ComboBox2.SelectedIndex = $var2
	$contextmenustrip1.Items[3].Text = "Удалялка"
	
	$statusbar1.Text = "Переключились на русский язык"
}

function R-Sync
{
	param (
		[Parameter(Mandatory = $true)]
		[int]$FlagCheck,
		[Parameter(Mandatory = $true)]
		[DateTime]$DateFrom,
		[Parameter(Mandatory = $true)]
		[DateTime]$DateTo,
		[Parameter(Mandatory = $true)]
		[string]$Name = "ALL"
	)

	switch ($FlagCheck)
	{
		{ ($_ -band $FLAG_MASK_SOUND) -eq $FLAG_MASK_SOUND }
		{
			# rsync sound
			if ($Name -ne "ALL")
			{
				$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$Name)::$($jsonCFG.DIR_SOUND)"
				$DST = "$($jsonCFG.PATH_REPLICATION)/$Name"
				$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
				$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
				if (Test-Path $var) { Remove-Item -Path $var }
				for ($ix = $DateFrom; $ix -le $DateTo; $ix = $ix.AddDays(1))
				{
					$line = "$('{0:yyyy}{0:dd}{0:MM}' -f $ix)"
					Add-Content -Path $var -Value $line
				}
				Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
			}
			else
			{
				foreach ($iy in $GLOBAL:HASH_CURRENT.Keys)
				{
					$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$iy)::$($jsonCFG.DIR_SOUND)"
					$DST = "$($jsonCFG.PATH_REPLICATION)/$iy"
					$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
					$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
					if (Test-Path $var) { Remove-Item -Path $var }
					for ($ix = $DateFrom; $ix -le $DateTo; $ix = $ix.AddDays(1))
					{
						$line = "$('{0:yyyy}{0:dd}{0:MM}' -f $ix)"
						Add-Content -Path $var -Value $line
					}
					Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
				}
			}
		}
		{ ($_ -band $FLAG_MASK_RADAR) -eq $FLAG_MASK_RADAR }
		{
			# rsync radar settings
			if ($Name -ne "ALL")
			{
				Start-Process rsync -WindowStyle Minimized -ArgumentList "-azP $($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$Name)::$($jsonCFG.DIR_RADAR)/*.rlp `"$($jsonCFG.PATH_REPLICATION)/$Name/$($jsonCFG.DIR_RADAR)`""
			}
			else
			{
				foreach ($iy in $GLOBAL:HASH_CURRENT.Keys)
				{
					Start-Process rsync -WindowStyle Minimized -ArgumentList "-azP $($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$iy)::$($jsonCFG.DIR_RADAR)/*.rlp `"$($jsonCFG.PATH_REPLICATION)/$iy/$($jsonCFG.DIR_RADAR)`""
				}
			}
		}
		{ ($_ -band $FLAG_MASK_RLI) -eq $FLAG_MASK_RLI }
		{
			# rsync rli
			if ($Name -ne "ALL")
			{
				$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$Name)::$($jsonCFG.DIR_RLI)"
				$DST = "$($jsonCFG.PATH_REPLICATION)/$Name/$($jsonCFG.DIR_RLI)"
				$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
				$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
				if (Test-Path $var) { Remove-Item -Path $var }
				$a = (rsync $SRC | where { $_ -match 'Record' }) -replace '^.*(Record.*)', '$1'
				foreach ($ix in $a)
				{
					$fDATE = Get-Date -Year ($ix -replace '.*(\d{4}).*', '$1') -Month ($ix -replace '.*(\d{4})...\s(\d{2}).*', '$2') -Day ($ix -replace '.*(\d{4})...\s(\d{2})...\s(\d{2}).*', '$3') -Hour ($ix -replace '.*(\d{4})...\s(\d{2})...\s(\d{2})...\s(\d{2}).*', '$4') -Minute 0
					if (($fDATE -ge $DateFrom) -and ($fDATE -le $DateTo)) { Add-Content -Path $var -Value $ix -Encoding BigEndianUnicode }
				}
				Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
			}
			else
			{
				foreach ($iy in $GLOBAL:HASH_CURRENT.Keys)
				{
					$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$iy)::$($jsonCFG.DIR_RLI)"
					$DST = "$($jsonCFG.PATH_REPLICATION)/$iy/$($jsonCFG.DIR_RLI)"
					$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
					$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
					if (Test-Path $var) { Remove-Item -Path $var }
					foreach ($ix in ((rsync $SRC | where { $_ -match 'Record' }) -replace '^.*(Record.*)', '$1'))
					{
						$fDATE = Get-Date -Year ($ix -replace 'Record (\d{4}).*(\d{2}).*(\d{2}).*(\d{2}).*', '$1') -Month ($ix -replace 'Record (\d{4}).*(\d{2}).*(\d{2}).*(\d{2}).*', '$3') -Day ($ix -replace 'Record (\d{4}).*(\d{2}).*(\d{2}).*(\d{2}).*', '$2')
						if (($fDATE -ge $DateFrom) -and ($fDATE -le $DateTo)) { Add-Content -Path $var -Value $ix -Encoding UCS2 }
					}
					Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
				}
			}
		}
		{ ($_ -band $FLAG_MASK_VIDEO) -eq $FLAG_MASK_VIDEO }
		{
			# rsync video info
			$TMP = (($jsonCFG.PATH_REPLICATION -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\'
			$xmlVCFG = (Get-Content $TMP\$Name\$($jsonCFG.DIR_VIDEO)\$($jsonCFG.FILE_SETT_VIDEO) -Encoding UTF8)
			foreach ($ix in $xmlVCFG)
			{
				if ($ix -match "xml version")
				{
					$xmlNEW += $ix + "`n`r" + "<Root>`n`r"
				}
				else
				{
					$xmlNEW += $ix + "`n`r"
				}
			}
			$xmlNEW += "</Root>`n`r"
			$xmlVCFG = [xml]$xmlNEW
			$LIST_VIDEO_SRC = $xmlVCFG.Root.ChildNodes.Name
			
			if ($Name -ne "ALL")
			{
				foreach ($iy in $LIST_VIDEO_SRC)
				{
					Check-Path $TMP\$Name\$($jsonCFG.DIR_VIDEO)\$iy
					$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$Name)::Video"
					$DST = "$($jsonCFG.PATH_REPLICATION)/$Name/$($jsonCFG.DIR_VIDEO)/$iy"
					$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
					$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
					if (Test-Path $var) { Remove-Item -Path $var }
					for ($ix = $DateFrom; $ix -le $DateTo; $ix = $ix.AddDays(1))
					{
						$line = "$('{0:yyyy}.{0:MM}.{0:dd}' -f $ix)"
						Add-Content -Path $var -Value $line
					}
					Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
				}
			}
			else
			{
				foreach ($iz in $GLOBAL:HASH_CURRENT.Keys)
				{
					foreach ($iy in $LIST_VIDEO_SRC)
					{
						Check-Path $TMP\$iz\$($jsonCFG.DIR_VIDEO)\$iy
						$SRC = "$($jsonCFG.USERNAME)@$($GLOBAL:HASH_CURRENT.$iz)::Video"
						$DST = "$($jsonCFG.PATH_REPLICATION)/$iz)/$($jsonCFG.DIR_VIDEO)/$iy"
						$var = "$($($($DST -replace '/cygdrive/') -replace '^(.)/', '$1:\') -replace '/', '\')" + "\$($jsonCFG.FILE_TMP)"
						$var_RSync = "$DST/$($jsonCFG.FILE_TMP)"
						if (Test-Path $var) { Remove-Item -Path $var }
						for ($ix = $DateFrom; $ix -le $DateTo; $ix = $ix.AddDays(1))
						{
							$line = "$('{0:yyyy}.{0:MM}.{0:dd}' -f $ix)"
							Add-Content -Path $var -Value $line
						}
						Start-Process rsync -WindowStyle Minimized -ArgumentList "-azrP --files-from=$var_RSync $SRC $DST"
					}
				}
			}
		}
	}
}

#Sample function that provides the location of the script
function Get-ScriptDirectory
{
<#
	.SYNOPSIS
		Get-ScriptDirectory returns the proper location of the script.

	.OUTPUTS
		System.String
	
	.NOTES
		Returns the correct path within a packaged executable.
#>
	[OutputType([string])]
	param ()
	if ($null -ne $hostinvocation)
	{
		Split-Path $hostinvocation.MyCommand.path
	}
	else
	{
		Split-Path $script:MyInvocation.MyCommand.Path
	}
}

#Sample variable that provides the location of the script
[string]$ScriptDirectory = Get-ScriptDirectory

