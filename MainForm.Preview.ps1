#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-MainForm_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$MainForm = New-Object 'System.Windows.Forms.Form'
	$groupbox3 = New-Object 'System.Windows.Forms.GroupBox'
	$combobox3 = New-Object 'System.Windows.Forms.ComboBox'
	$groupbox2 = New-Object 'System.Windows.Forms.GroupBox'
	$combobox2 = New-Object 'System.Windows.Forms.ComboBox'
	$maskedtextbox4 = New-Object 'System.Windows.Forms.MaskedTextBox'
	$combobox1 = New-Object 'System.Windows.Forms.ComboBox'
	$maskedtextbox3 = New-Object 'System.Windows.Forms.MaskedTextBox'
	$maskedtextbox2 = New-Object 'System.Windows.Forms.MaskedTextBox'
	$maskedtextbox1 = New-Object 'System.Windows.Forms.MaskedTextBox'
	$labelTpDate = New-Object 'System.Windows.Forms.Label'
	$labelFromDate = New-Object 'System.Windows.Forms.Label'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$checkedlistbox1 = New-Object 'System.Windows.Forms.CheckedListBox'
	$checkboxSelectAll = New-Object 'System.Windows.Forms.CheckBox'
	$buttonApply = New-Object 'System.Windows.Forms.Button'
	$buttonCancel = New-Object 'System.Windows.Forms.Button'
	$buttonOK = New-Object 'System.Windows.Forms.Button'
	$imagelistSmall = New-Object 'System.Windows.Forms.ImageList'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$MainForm.SuspendLayout()
	$groupbox1.SuspendLayout()
	$groupbox2.SuspendLayout()
	$groupbox3.SuspendLayout()
	#
	# MainForm
	#
	$MainForm.Controls.Add($groupbox3)
	$MainForm.Controls.Add($groupbox2)
	$MainForm.Controls.Add($groupbox1)
	$MainForm.Controls.Add($buttonApply)
	$MainForm.Controls.Add($buttonCancel)
	$MainForm.Controls.Add($buttonOK)
	$MainForm.AutoScaleDimensions = '6, 13'
	$MainForm.AutoScaleMode = 'Font'
	$MainForm.ClientSize = '330, 369'
	$MainForm.Margin = '4, 4, 4, 4'
	$MainForm.Name = 'MainForm'
	$MainForm.StartPosition = 'CenterScreen'
	$MainForm.Text = 'ReplicationTool'
	$MainForm.add_Load($MainForm_Load)
	#
	# groupbox3
	#
	$groupbox3.Controls.Add($combobox3)
	$groupbox3.Location = '12, 252'
	$groupbox3.Name = 'groupbox3'
	$groupbox3.Size = '304, 60'
	$groupbox3.TabIndex = 8
	$groupbox3.TabStop = $False
	$groupbox3.Text = 'Source'
	$groupbox3.UseCompatibleTextRendering = $True
	#
	# combobox3
	#
	$combobox3.FormattingEnabled = $True
	$combobox3.Location = '7, 20'
	$combobox3.Name = 'combobox3'
	$combobox3.Size = '121, 21'
	$combobox3.TabIndex = 0
	#
	# groupbox2
	#
	$groupbox2.Controls.Add($combobox2)
	$groupbox2.Controls.Add($maskedtextbox4)
	$groupbox2.Controls.Add($combobox1)
	$groupbox2.Controls.Add($maskedtextbox3)
	$groupbox2.Controls.Add($maskedtextbox2)
	$groupbox2.Controls.Add($maskedtextbox1)
	$groupbox2.Controls.Add($labelTpDate)
	$groupbox2.Controls.Add($labelFromDate)
	$groupbox2.Location = '12, 146'
	$groupbox2.Name = 'groupbox2'
	$groupbox2.Size = '304, 84'
	$groupbox2.TabIndex = 7
	$groupbox2.TabStop = $False
	$groupbox2.Text = 'Date'
	$groupbox2.UseCompatibleTextRendering = $True
	#
	# combobox2
	#
	$combobox2.FormattingEnabled = $True
	[void]$combobox2.Items.Add('January')
	[void]$combobox2.Items.Add('February')
	[void]$combobox2.Items.Add('March')
	[void]$combobox2.Items.Add('April')
	[void]$combobox2.Items.Add('May')
	[void]$combobox2.Items.Add('June')
	[void]$combobox2.Items.Add('July')
	[void]$combobox2.Items.Add('August')
	[void]$combobox2.Items.Add('September')
	[void]$combobox2.Items.Add('October')
	[void]$combobox2.Items.Add('November')
	[void]$combobox2.Items.Add('December')
	$combobox2.Location = '103, 47'
	$combobox2.Name = 'combobox2'
	$combobox2.Size = '121, 21'
	$combobox2.TabIndex = 2
	#
	# maskedtextbox4
	#
	$maskedtextbox4.Location = '230, 48'
	$maskedtextbox4.Mask = '2\000'
	$maskedtextbox4.Name = 'maskedtextbox4'
	$maskedtextbox4.Size = '40, 20'
	$maskedtextbox4.TabIndex = 1
	#
	# combobox1
	#
	$combobox1.FormattingEnabled = $True
	[void]$combobox1.Items.Add('January')
	[void]$combobox1.Items.Add('February')
	[void]$combobox1.Items.Add('March')
	[void]$combobox1.Items.Add('April')
	[void]$combobox1.Items.Add('May')
	[void]$combobox1.Items.Add('June')
	[void]$combobox1.Items.Add('July')
	[void]$combobox1.Items.Add('August')
	[void]$combobox1.Items.Add('September')
	[void]$combobox1.Items.Add('October')
	[void]$combobox1.Items.Add('November')
	[void]$combobox1.Items.Add('December')
	$combobox1.Location = '103, 20'
	$combobox1.Name = 'combobox1'
	$combobox1.Size = '121, 21'
	$combobox1.TabIndex = 2
	#
	# maskedtextbox3
	#
	$maskedtextbox3.Location = '73, 47'
	$maskedtextbox3.Mask = '00'
	$maskedtextbox3.Name = 'maskedtextbox3'
	$maskedtextbox3.Size = '23, 20'
	$maskedtextbox3.TabIndex = 1
	#
	# maskedtextbox2
	#
	$maskedtextbox2.Location = '230, 21'
	$maskedtextbox2.Mask = '2\000'
	$maskedtextbox2.Name = 'maskedtextbox2'
	$maskedtextbox2.Size = '40, 20'
	$maskedtextbox2.TabIndex = 1
	#
	# maskedtextbox1
	#
	$maskedtextbox1.Location = '73, 20'
	$maskedtextbox1.Mask = '00'
	$maskedtextbox1.Name = 'maskedtextbox1'
	$maskedtextbox1.Size = '23, 20'
	$maskedtextbox1.TabIndex = 1
	#
	# labelTpDate
	#
	$labelTpDate.AutoSize = $True
	$labelTpDate.Location = '7, 53'
	$labelTpDate.Name = 'labelTpDate'
	$labelTpDate.Size = '46, 17'
	$labelTpDate.TabIndex = 0
	$labelTpDate.Text = 'Tp date:'
	$labelTpDate.UseCompatibleTextRendering = $True
	#
	# labelFromDate
	#
	$labelFromDate.AutoSize = $True
	$labelFromDate.Location = '7, 20'
	$labelFromDate.Name = 'labelFromDate'
	$labelFromDate.Size = '59, 17'
	$labelFromDate.TabIndex = 0
	$labelFromDate.Text = 'From date:'
	$labelFromDate.UseCompatibleTextRendering = $True
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($checkedlistbox1)
	$groupbox1.Controls.Add($checkboxSelectAll)
	$groupbox1.Location = '12, 12'
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = '304, 116'
	$groupbox1.TabIndex = 6
	$groupbox1.TabStop = $False
	$groupbox1.Text = 'Type information'
	$groupbox1.UseCompatibleTextRendering = $True
	#
	# checkedlistbox1
	#
	$checkedlistbox1.FormattingEnabled = $True
	[void]$checkedlistbox1.Items.Add('Sound')
	[void]$checkedlistbox1.Items.Add('Radar')
	[void]$checkedlistbox1.Items.Add('Radio info')
	[void]$checkedlistbox1.Items.Add('Video')
	$checkedlistbox1.Location = '7, 40'
	$checkedlistbox1.Name = 'checkedlistbox1'
	$checkedlistbox1.Size = '249, 64'
	$checkedlistbox1.TabIndex = 1
	$checkedlistbox1.UseCompatibleTextRendering = $True
	#
	# checkboxSelectAll
	#
	$checkboxSelectAll.Location = '7, 20'
	$checkboxSelectAll.Name = 'checkboxSelectAll'
	$checkboxSelectAll.Size = '104, 24'
	$checkboxSelectAll.TabIndex = 0
	$checkboxSelectAll.Text = 'Select all'
	$checkboxSelectAll.UseCompatibleTextRendering = $True
	$checkboxSelectAll.UseVisualStyleBackColor = $True
	$checkboxSelectAll.add_Click($ClickSelectAll)
	#
	# buttonApply
	#
	$buttonApply.Anchor = 'Bottom, Right'
	$buttonApply.DialogResult = 'OK'
	$buttonApply.Location = '159, 334'
	$buttonApply.Name = 'buttonApply'
	$buttonApply.Size = '75, 23'
	$buttonApply.TabIndex = 4
	$buttonApply.Text = '&Apply'
	$buttonApply.UseCompatibleTextRendering = $True
	$buttonApply.UseVisualStyleBackColor = $True
	$buttonApply.add_Click($ClickApply)
	#
	# buttonCancel
	#
	$buttonCancel.Anchor = 'Bottom, Right'
	$buttonCancel.CausesValidation = $False
	$buttonCancel.DialogResult = 'Cancel'
	$buttonCancel.Location = '78, 334'
	$buttonCancel.Name = 'buttonCancel'
	$buttonCancel.Size = '75, 23'
	$buttonCancel.TabIndex = 2
	$buttonCancel.Text = '&Cancel'
	$buttonCancel.UseCompatibleTextRendering = $True
	$buttonCancel.UseVisualStyleBackColor = $True
	$buttonCancel.add_Click($ClickCancel)
	#
	# buttonOK
	#
	$buttonOK.Anchor = 'Bottom, Right'
	$buttonOK.CausesValidation = $False
	$buttonOK.DialogResult = 'Cancel'
	$buttonOK.Location = '240, 334'
	$buttonOK.Name = 'buttonOK'
	$buttonOK.Size = '75, 23'
	$buttonOK.TabIndex = 3
	$buttonOK.Text = '&OK'
	$buttonOK.UseCompatibleTextRendering = $True
	$buttonOK.UseVisualStyleBackColor = $True
	$buttonOK.add_Click($ClickOk)
	#
	# imagelistSmall
	#
	$Formatter_binaryFomatter = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
	#region Binary Data
	$System_IO_MemoryStream = New-Object System.IO.MemoryStream (,[byte[]][System.Convert]::FromBase64String('
AAEAAAD/////AQAAAAAAAAAMAgAAAFdTeXN0ZW0uV2luZG93cy5Gb3JtcywgVmVyc2lvbj00LjAu
MC4wLCBDdWx0dXJlPW5ldXRyYWwsIFB1YmxpY0tleVRva2VuPWI3N2E1YzU2MTkzNGUwODkFAQAA
ACZTeXN0ZW0uV2luZG93cy5Gb3Jtcy5JbWFnZUxpc3RTdHJlYW1lcgEAAAAERGF0YQcCAgAAAAkD
AAAADwMAAAAwBgAAAk1TRnQBSQFMAwEBAAEwAQEBMAEBARABAAEQAQAE/wEhAQAI/wFCAU0BNgcA
ATYDAAEoAwABQAMAARADAAEBAQABIAYAARAWAAMCAQMDHwEsA0YBgQNOAZUDQAFuAxgBIAMJAQwD
AgEDAwkBDAMdASkDOQFeAzABTAMJAQzIAAQBAzsBZQFmAVIBTAH3AYUBcAFfAf8BzAHDAboB/wHw
Ae4B6wH/A4EB5ANMAY4BVwJWAbUBcQFmAWAB4AG0AX0BYAH8AcEBhgFgAf8BhAFiAUMB/AFWAlUB
rgMdASgEAsAAAyEBMAFuAVcBTQH6AXsBaAFWAf4BjgGAAX4B/gHgAdsB1QH/AfkB+AH3Af8B9AHy
AfAB/wHRAcUBuwH/Ab0BiAFnAf8BygGOAWgB/wHMAZQBcgH/AdcBuQGpAf8BuwGnAZ0B/wGgAWoB
TwH/AlEBUAGfAx4BKsAAAk8BTgGXAXUBYgFQAf8BggF8AW8B/AGxAaoBogH5AekB4QHbAf8B8wHx
Ae8B/wHeAdkB0gH/AaYBmQGLAf8BpQGGAWwB/wHfAccBugH/AewB6gHpAf8D6AH/AdEBywHGAf8B
vwGhAZAB/wNLAY0DIAEtwAABWgJZAcABeQFmAVQB/wGPAYkBggH1AZUBjwGKAewB3QG4AaMB/wHl
AdoB0wH/AbQBqAGdAf8BewFqAVgB/wGMAXoBbQH/A+wB/wPuAf8D6gH/AckBvAGyAf8B1AGtAY4B
/wNFAXwDCQEMwAADVgGzAYgBdAFjAf8BsgGoAZ8B+wGrAaQBnwH1AdcBuwGrAf8B5gHgAdsB/wGe
AZABgQH/AXQBYQFPAf8BjAF6AWwB/wPuAf8D7wH/A+wB/wG+AbsBuAH/AbkBsQGrAf8DQwF2xAAD
PwFtAbcBrAGgAf8B3wHbAdcB/gHnAeYB5AH+AeUB4gHfAf8BtwGtAaMB/wGMAXcBZgH/AXIBYAFN
Af8BqwGhAZcB/wPyAf8D8QH/A+4B/wHKAcIBuwH/Ac0BwwG7Af8DQgF1xAADCAEKAXACbQHYAfgB
9wH2Af8B9QH0AfIB/wHNAcUBvQH/AYkBdQFkAf8BcQFfAUwB/wF3AWUBUwH/AecB5QHjAf8D9AH/
A/IB/wPuAf8BywHHAcMB/wHKAcUBwAH/A0IBdcgAAxcBHwNlAckB6AHkAd8B/wG3AawBoQH/AXEB
XwFOAf8BbwFeAU0B/wHXAdIBzgH/A/kB/wP1Af8D8gH/A+4B/wHOAcsByQH/A8kB/wNCAXXMAAQB
A1sBuQHTAc0ByAH/AckBwwG+Af8B8AHvAe4B/wP7Af8D+gH/A/UB/wPyAf8D7gH/AcIBvwG9Af8B
1gLYAf8DQgF10AADVgGvA/EB/wPzAf8D9wH/A/sB/wP6Af8D9wH/AfIC8QH/Ae4B4gHbAf8BsQGj
AZsB/wGvAbABsQH/A0IBddAAA1cBsQPxAf8D8wH/A/YB/wP7Af8B9QHsAecB/wHtAdUByAH/AeoB
wwGtAf8B6gHAAaoB/wGtAZEBgQH/AbECrwH/A0IBddAAA1cBsgPwAf8B7wHrAekB/wHhAcUBtQH/
AdMBngGBAf8B2gGoAY0B/wHhAbQBmwH/AeUBuQGgAf8B5gG8AaQB/wGoAYABdQH+AdUBqAGNAf8D
QgF10AACWQFYAbQB2QGzAZ4B/wHTAZ0BewH/AcoBiQFeAf8BzQGRAWkB/wHPAZ8BgAH/AccBmQF5
Af8BvgGTAXMB/wG4AY4BbwH/AYcBaQFNAf4BzAGZAXYB/wNCAXXQAANWAbAB1wGfAYAB/gHbAaUB
gAH+AdoBogGAAf4B1gGhAYAB/gHKAZUBgAH+Ab4BhwFyAf4BsgGAAWIB/gGnAXgBUQH+AZQBaAFD
Af4BhgFhAUAB/gNAAXDQAAMNAREDMwFRA0sBjANKAYoDRAF6Az0BaQM2AVkDLwFJAyYBOAMdASgD
EgEYAwMBBMQAAUIBTQE+BwABPgMAASgDAAFAAwABEAMAAQEBAAEBBQABgBcAA/8BAAGAAQMnAAEB
BwABAQcAAQEGAAGAAQEGAAHAAQEGAAHgAQEGAAHgAQEGAAHgAQEGAAHgAQEGAAHgAQEGAAHgAQEG
AAs='))
	#endregion
	$imagelistSmall.ImageStream = $Formatter_binaryFomatter.Deserialize($System_IO_MemoryStream)
	$Formatter_binaryFomatter = $null
	$System_IO_MemoryStream = $null
	$imagelistSmall.TransparentColor = 'Transparent'
	$groupbox3.ResumeLayout()
	$groupbox2.ResumeLayout()
	$groupbox1.ResumeLayout()
	$MainForm.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $MainForm.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$MainForm.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$MainForm.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $MainForm.ShowDialog()

} #End Function

#Call the form
Show-MainForm_psf | Out-Null
