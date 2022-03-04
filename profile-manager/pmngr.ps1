# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# THIS CODE AND ANY ASSOCIATED INFORMATION ARE PROVIDED “AS IS” WITHOUT
# WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK OF USE, INABILITY TO USE, OR 
# RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# AUTHOR: Mihai Filip
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# Dependencies: WinOS
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# USAGE: 
# .\tms-ProfileManager.ps1 (or EXE)
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# TODO:
# test with no profiles installed, deactivate buttons and list if needed

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
# FUNCTIONS
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
Function New-CustomProfile {
  # credit for code in this function: https://gist.github.com/DanielSmon/cc3fa072857f0272257a5fd451768c3a
  param (
    [string]$pName
  )

  $PN = $pName
  Write-Output "Launching $PN Teams Profile ..."

  $userProfile = $env:USERPROFILE
  $appDataPath = $env:LOCALAPPDATA
  $customProfile = "$appDataPath\Microsoft\Teams\CustomProfiles\$PN"
  $downloadPath = Join-Path $customProfile "Downloads"

  if (!(Test-Path -PathType Container $downloadPath)) {
    New-Item $downloadPath -ItemType Directory |
      Select-Object -ExpandProperty FullName
  }

  $env:USERPROFILE = $customProfile
  Start-Process `
    -FilePath "$appDataPath\Microsoft\Teams\Update.exe" `
    -ArgumentList '--processStart "Teams.exe"' `
    -WorkingDirectory "$appDataPath\Microsoft\Teams"

}

Function Get-CustomProfiles {
  $profiles = gci -path "$($env:localappdata)\Microsoft\Teams\CustomProfiles"

  return $profiles
}

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
#----Initial Declarations
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="718" Height="355" Name="TMSProfileManager" Title="Teams - Profile Manager" ResizeMode="NoResize" WindowStartupLocation="CenterScreen"><Window.Resources>
	<ResourceDictionary>
		<ResourceDictionary.MergedDictionaries>
			<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"  xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"  xmlns:d="http://schemas.microsoft.com/expression/blend/2008"  xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"  mc:Ignorable="d">
				<ResourceDictionary.MergedDictionaries>
					<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="d" xmlns:System="clr-namespace:System;assembly=mscorlib">
						<ResourceDictionary.MergedDictionaries>
							<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="d">
								<SolidColorBrush x:Key="Brush01" Color="#FFb9cee6"/>
								<SolidColorBrush x:Key="Brush02" Color="#FF87AAD0"/>
								<SolidColorBrush x:Key="Brush03" Color="#FF516189"/>
								<SolidColorBrush x:Key="Brush04" Color="#FFEDDD39"/>
								<SolidColorBrush x:Key="Brush05" Color="#FFFFA500"/>
								<Color x:Key="Color_001">#FF181818</Color>
								<Color x:Key="Color_002">#FF8B8B8B</Color>
								<Color x:Key="Color_003">#FFC0C0C0</Color>
								<Color x:Key="Color_004">#FFDADCDD</Color>
								<Color x:Key="Color_005">#FFFFFFFF</Color>
								<Color x:Key="Color_006">#FF7C2320</Color>
								<Color x:Key="Color_007">#FFAB322E</Color>
								<Color x:Key="Color_008">#FF9B3D3D</Color>
								<Color x:Key="Color_009">#FFda6163</Color>
								<Color x:Key="Color_010">#FFf27776</Color>
								<Color x:Key="Color_011">#FFff8482</Color>
								<Color x:Key="Color_012">#FFC26D1D</Color>
								<Color x:Key="Color_013">#FFDEA414</Color>
								<Color x:Key="Color_014">#FFF2BF3A</Color>
								<Color x:Key="Color_015">#FFF7D14C</Color>
								<Color x:Key="Color_016">#FFF8D25F</Color>
								<Color x:Key="Color_017">#FFFBDC6E</Color>
								<Color x:Key="Color_018">#FFffeea8</Color>
								<Color x:Key="Color_019">#FFfffce0</Color>
								<Color x:Key="Color_020">#FF527211</Color>
								<Color x:Key="Color_021">#FF739F19</Color>
								<Color x:Key="Color_022">#FFABD652</Color>
								<Color x:Key="Color_023">#FF152A43</Color>
								<Color x:Key="Color_024">#FF233E60</Color>
								<Color x:Key="Color_025">#FF345176</Color>
								<Color x:Key="Color_026">#FF547297</Color>
								<Color x:Key="Color_0261">#FF708BAD</Color>
								<Color x:Key="Color_027">#FF8CA6C9</Color>
								<Color x:Key="Color_028">#FFA6BBD7</Color>
								<Color x:Key="Color_029">#FFC1D4EC</Color>
								<Color x:Key="Color_030">#FFCBDBEF</Color>
								<Color x:Key="Color_031">#FFDBE6F3</Color>
								<Color x:Key="Color_032">#FFE9F0F7</Color>
								<Color x:Key="Color_033">#00FFFFFF</Color>
								<Color x:Key="Color_0331">#7FFFFFFF</Color>
								<Color x:Key="Color_034">#00000000</Color>
								<Color x:Key="Color_035">#0C000000</Color>
								<Color x:Key="Color_036">#26000000</Color>
								<Color x:Key="Color_037">#4CA0B0C7</Color>
								<Color x:Key="Color_038">#00A5BBD3</Color>
								<Color x:Key="Color_039">#00f27776</Color>
								<Color x:Key="Color_1000">#FF17447C</Color>
								<Color x:Key="Color_1001">#FF3969A5</Color>
								<Color x:Key="Color_1002">#FF4681CA</Color>
								<Color x:Key="Color_1003">#FFAB322E</Color>
								<Color x:Key="Color_1004">#FFD05C53</Color>
								<Color x:Key="Color_1005">#FFE79089</Color>
								<Color x:Key="Color_1006">#FF3B7E32</Color>
								<Color x:Key="Color_1007">#FF739F19</Color>
								<Color x:Key="Color_1008">#FF99C838</Color>
								<Color x:Key="Color_1009">#FFBCDC7B</Color>
								<Color x:Key="Color_1010">#FF218F8F</Color>
								<Color x:Key="Color_1011">#FF53C4C4</Color>
								<Color x:Key="Color_1012">#FF80E4E4</Color>
								<Color x:Key="Color_1013">#FF694691</Color>
								<Color x:Key="Color_1014">#FF916CBE</Color>
								<Color x:Key="Color_1015">#FFB99EDA</Color>
								<Color x:Key="Color_1016">#FFD2660D</Color>
								<Color x:Key="Color_1017">#FFF18B36</Color>
								<Color x:Key="Color_1018">#FFF99544</Color>
								<Color x:Key="Color_1020">#FFFDB881</Color>
								<Color x:Key="Color_1021">#FF616161</Color>
								<Color x:Key="Color_1022">#FF395D8A</Color>
								<Color x:Key="Color_1023">#FF446FA3</Color>
								<Color x:Key="Color_1024">#FF4F81BD</Color>
								<Color x:Key="Color_1025">#FF6C96C7</Color>
								<Color x:Key="Color_1026">#FF8AAAD2</Color>
							</ResourceDictionary>
							<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:System="clr-namespace:System;assembly=mscorlib" xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="d">
								<ResourceDictionary.MergedDictionaries>
									<ResourceDictionary xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="d">
										<SolidColorBrush x:Key="Brush01" Color="#FFb9cee6"/>
										<SolidColorBrush x:Key="Brush02" Color="#FF87AAD0"/>
										<SolidColorBrush x:Key="Brush03" Color="#FF516189"/>
										<SolidColorBrush x:Key="Brush04" Color="#FFEDDD39"/>
										<SolidColorBrush x:Key="Brush05" Color="#FFFFA500"/>
										<Color x:Key="Color_001">#FF181818</Color>
										<Color x:Key="Color_002">#FF8B8B8B</Color>
										<Color x:Key="Color_003">#FFC0C0C0</Color>
										<Color x:Key="Color_004">#FFDADCDD</Color>
										<Color x:Key="Color_005">#FFFFFFFF</Color>
										<Color x:Key="Color_006">#FF7C2320</Color>
										<Color x:Key="Color_007">#FFAB322E</Color>
										<Color x:Key="Color_008">#FF9B3D3D</Color>
										<Color x:Key="Color_009">#FFda6163</Color>
										<Color x:Key="Color_010">#FFf27776</Color>
										<Color x:Key="Color_011">#FFff8482</Color>
										<Color x:Key="Color_012">#FFC26D1D</Color>
										<Color x:Key="Color_013">#FFDEA414</Color>
										<Color x:Key="Color_014">#FFF2BF3A</Color>
										<Color x:Key="Color_015">#FFF7D14C</Color>
										<Color x:Key="Color_016">#FFF8D25F</Color>
										<Color x:Key="Color_017">#FFFBDC6E</Color>
										<Color x:Key="Color_018">#FFffeea8</Color>
										<Color x:Key="Color_019">#FFfffce0</Color>
										<Color x:Key="Color_020">#FF527211</Color>
										<Color x:Key="Color_021">#FF739F19</Color>
										<Color x:Key="Color_022">#FFABD652</Color>
										<Color x:Key="Color_023">#FF152A43</Color>
										<Color x:Key="Color_024">#FF233E60</Color>
										<Color x:Key="Color_025">#FF345176</Color>
										<Color x:Key="Color_026">#FF547297</Color>
										<Color x:Key="Color_0261">#FF708BAD</Color>
										<Color x:Key="Color_027">#FF8CA6C9</Color>
										<Color x:Key="Color_028">#FFA6BBD7</Color>
										<Color x:Key="Color_029">#FFC1D4EC</Color>
										<Color x:Key="Color_030">#FFCBDBEF</Color>
										<Color x:Key="Color_031">#FFDBE6F3</Color>
										<Color x:Key="Color_032">#FFE9F0F7</Color>
										<Color x:Key="Color_033">#00FFFFFF</Color>
										<Color x:Key="Color_0331">#7FFFFFFF</Color>
										<Color x:Key="Color_034">#00000000</Color>
										<Color x:Key="Color_035">#0C000000</Color>
										<Color x:Key="Color_036">#26000000</Color>
										<Color x:Key="Color_037">#4CA0B0C7</Color>
										<Color x:Key="Color_038">#00A5BBD3</Color>
										<Color x:Key="Color_039">#00f27776</Color>
										<Color x:Key="Color_1000">#FF17447C</Color>
										<Color x:Key="Color_1001">#FF3969A5</Color>
										<Color x:Key="Color_1002">#FF4681CA</Color>
										<Color x:Key="Color_1003">#FFAB322E</Color>
										<Color x:Key="Color_1004">#FFD05C53</Color>
										<Color x:Key="Color_1005">#FFE79089</Color>
										<Color x:Key="Color_1006">#FF3B7E32</Color>
										<Color x:Key="Color_1007">#FF739F19</Color>
										<Color x:Key="Color_1008">#FF99C838</Color>
										<Color x:Key="Color_1009">#FFBCDC7B</Color>
										<Color x:Key="Color_1010">#FF218F8F</Color>
										<Color x:Key="Color_1011">#FF53C4C4</Color>
										<Color x:Key="Color_1012">#FF80E4E4</Color>
										<Color x:Key="Color_1013">#FF694691</Color>
										<Color x:Key="Color_1014">#FF916CBE</Color>
										<Color x:Key="Color_1015">#FFB99EDA</Color>
										<Color x:Key="Color_1016">#FFD2660D</Color>
										<Color x:Key="Color_1017">#FFF18B36</Color>
										<Color x:Key="Color_1018">#FFF99544</Color>
										<Color x:Key="Color_1020">#FFFDB881</Color>
										<Color x:Key="Color_1021">#FF616161</Color>
										<Color x:Key="Color_1022">#FF395D8A</Color>
										<Color x:Key="Color_1023">#FF446FA3</Color>
										<Color x:Key="Color_1024">#FF4F81BD</Color>
										<Color x:Key="Color_1025">#FF6C96C7</Color>
										<Color x:Key="Color_1026">#FF8AAAD2</Color>
									</ResourceDictionary>
								</ResourceDictionary.MergedDictionaries>
								<SolidColorBrush x:Key="ForegroundBrush" Color="{StaticResource Color_001}"/>
								<SolidColorBrush x:Key="LightForegroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="ThemeForegroundBrush" Color="{StaticResource Color_023}"/>
								<SolidColorBrush x:Key="ForegroundDisabledBrush" Color="{StaticResource Color_003}"/>
								<SolidColorBrush x:Key="HyperlinkForegroundBrush" Color="{StaticResource Color_026}"/>
								<SolidColorBrush x:Key="GridBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="GridBorderBrush" Color="{StaticResource Color_027}"/>
								<LinearGradientBrush x:Key="LightGradientBrush" EndPoint="0.5,1" StartPoint="0.5,0">
									<GradientStop Color="{StaticResource Color_031}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_032}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="PopupBackgroundBrush" EndPoint="0.5,1" StartPoint="0.5,0">
									<GradientStop Color="{StaticResource Color_032}"/>
									<GradientStop Color="{StaticResource Color_031}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="PopupBorderBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_028}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="TooltipBackgroundBrush" EndPoint="0.5,1" StartPoint="0.5,0" Opacity="0.9">
									<GradientStop Color="{StaticResource Color_030}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_005}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="TooltipBorderBrush" Color="{StaticResource Color_027}" Opacity="0.9"/>
								<SolidColorBrush x:Key="SeparatorBrush" Color="{StaticResource Color_027}"/>
								<SolidColorBrush x:Key="ReadOnlyBgBrush" Color="{StaticResource Color_003}"/>
								<SolidColorBrush x:Key="DisabledBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="TransparentBrush" Color="{StaticResource Color_033}"/>
								<SolidColorBrush x:Key="ValidationErrorBrush" Color="{StaticResource Color_007}" />
								<SolidColorBrush x:Key="ShadowBackgroundBrush" Color="{StaticResource Color_001}"/>
								<LinearGradientBrush x:Key="ButtonBackgroundBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Color="{StaticResource Color_030}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_032}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ButtonBorderBrush" Color="{StaticResource Color_027}"/>
								<LinearGradientBrush x:Key="ButtonHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_018}"/>
									<GradientStop Offset="0.23" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="0.75" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_019}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ButtonHoverHighlightBorderBrush" Color="{StaticResource Color_019}"/>
								<LinearGradientBrush x:Key="ButtonHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ButtonPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_017}"/>
									<GradientStop Color="{StaticResource Color_016}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ButtonPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ButtonFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<LinearGradientBrush x:Key="ToggleButtonBackgroundBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Color="{StaticResource Color_030}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_032}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ToggleButtonBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Color="{StaticResource Color_029}"/>
									<GradientStop Color="{StaticResource Color_027}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ToggleButtonHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_018}"/>
									<GradientStop Offset="0.23" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="0.75" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_019}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ToggleButtonHoverHighlightBorderBrush" Color="{StaticResource Color_019}"/>
								<LinearGradientBrush x:Key="ToggleButtonHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ToggleButtonPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_017}"/>
									<GradientStop Color="{StaticResource Color_016}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ToggleButtonPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ToggleButtonFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="CheckBoxBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="CheckBoxBorderBrush" Color="{StaticResource Color_027}"/>
								<LinearGradientBrush x:Key="CheckBoxInnerBackgroundBrush"  EndPoint="0.639999985694885,0.879999995231628" StartPoint="0.620000004768372,0.150000005960464">
									<GradientStop Color="{StaticResource Color_004}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_005}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="CheckBoxInnerBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_030}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="CheckBoxHoverBorderBrush" Color="{StaticResource Color_012}"/>
								<SolidColorBrush x:Key="CheckBoxHoverBackgroundBrush" Color="{StaticResource Color_018}"/>
								<SolidColorBrush x:Key="CheckBoxPressedBorderBrush" Color="{StaticResource Color_012}"/>
								<SolidColorBrush x:Key="CheckBoxPressedBackgroundBrush" Color="{StaticResource Color_018}"/>
								<LinearGradientBrush x:Key="CheckBoxInnerHoverBackgroundBrush" EndPoint="0.64,0.88" StartPoint="0.62,0.15">
									<GradientStop Color="{StaticResource Color_018}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_019}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="CheckBoxInnerHoverBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_016}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_012}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="CheckBoxPressedInnerBackgroundBrush" EndPoint="0.64,0.88" StartPoint="0.62,0.15">
									<GradientStop Color="{StaticResource Color_018}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_019}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="CheckBoxPressedInnerBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_012}"/>
									<GradientStop Color="{StaticResource Color_016}" Offset="1"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="CheckBoxCheckIconBackgroundBrush" Color="{StaticResource Color_025}"/>
								<SolidColorBrush x:Key="CheckBoxIndeterminateIconBackgroundBrush" Color="{StaticResource Color_025}"/>
								<SolidColorBrush x:Key="CheckBoxFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="RadioButtonBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="RadioButtonBorderBrush" Color="{StaticResource Color_027}"/>
								<LinearGradientBrush x:Key="RadioButtonInnerBackgroundBrush"  EndPoint="0.639999985694885,0.879999995231628" StartPoint="0.620000004768372,0.150000005960464">
									<GradientStop Color="{StaticResource Color_004}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_005}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="RadioButtonInnerBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_030}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="RadioButtonHoverBorderBrush" Color="{StaticResource Color_012}"/>
								<SolidColorBrush x:Key="RadioButtonHoverBackgroundBrush" Color="{StaticResource Color_018}"/>
								<SolidColorBrush x:Key="RadioButtonPressedBorderBrush" Color="{StaticResource Color_012}"/>
								<SolidColorBrush x:Key="RadioButtonPressedBackgroundBrush" Color="{StaticResource Color_018}"/>
								<LinearGradientBrush x:Key="RadioButtonInnerHoverBackgroundBrush" EndPoint="0.64,0.88" StartPoint="0.62,0.15">
									<GradientStop Color="{StaticResource Color_018}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_019}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="RadioButtonInnerHoverBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_016}" Offset="1"/>
									<GradientStop Color="{StaticResource Color_012}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="RadioButtonPressedInnerBackgroundBrush" EndPoint="0.64,0.88" StartPoint="0.62,0.15">
									<GradientStop Color="{StaticResource Color_018}" Offset="0.013"/>
									<GradientStop Color="{StaticResource Color_019}" Offset="1"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="RadioButtonPressedInnerBorderBrush" EndPoint=".5,1" StartPoint=".5,0">
									<GradientStop Color="{StaticResource Color_012}"/>
									<GradientStop Color="{StaticResource Color_016}" Offset="1"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="RadioButtonCheckIconBorderBrush" Color="{StaticResource Color_024}"/>
								<LinearGradientBrush x:Key="RadioButtonCheckIconBackgroundBrush" EndPoint="0.5,1" StartPoint="0.5,0">
									<GradientStop Color="{StaticResource Color_025}" Offset="0.008"/>
									<GradientStop Color="{StaticResource Color_024}" Offset="1"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="RadioButtonIndeterminateIconBackgroundBrush" Color="{StaticResource Color_025}"/>
								<SolidColorBrush x:Key="RadioButtonFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="ScrollViewerCornerBackgroundBrush" Color="{StaticResource Color_029}"/>
								<SolidColorBrush x:Key="ScrollViewerCornerBorderBrush" Color="{StaticResource Color_027}"/>
								<SolidColorBrush x:Key="ScrollBarTrackBorderBrush" Color="{StaticResource Color_027}" />
								<LinearGradientBrush x:Key="HScrollBarTrackBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_028}" />
									<GradientStop Offset="0.40" Color="{StaticResource Color_029}" />
									<GradientStop Offset="1" Color="{StaticResource Color_029}" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarTrackBackgroundBrush" StartPoint="0.062,0.096" EndPoint="0.98,0.096">
									<GradientStop Offset="0" Color="{StaticResource Color_028}" />
									<GradientStop Offset="0.40" Color="{StaticResource Color_029}" />
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ScrollBarButtonlBorderBrush" Color="{StaticResource Color_026}"/>
								<SolidColorBrush x:Key="ScrollBarButtonlHighlightBackgroundBrush" Color="{StaticResource Color_029}"/>
								<LinearGradientBrush x:Key="HScrollBarButtonlBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0.15" Color="{StaticResource Color_029}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="HScrollBarButtonlHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0.15" Color="{StaticResource Color_029}"/>
									<GradientStop Offset="0.89" Color="{StaticResource Color_028}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="HScrollBarButtonlPressedBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0.15" Color="{StaticResource Color_028}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarButtonlBackgroundBrush" StartPoint="0.062,0.096" EndPoint="0.98,0.096">
									<GradientStop Offset="0.15" Color="{StaticResource Color_029}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_027}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarButtonlHoverBackgroundBrush" StartPoint="0,0" EndPoint="1,0">
									<GradientStop Offset="0.15" Color="{StaticResource Color_029}"/>
									<GradientStop Offset="0.89" Color="{StaticResource Color_028}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarButtonlPressedBackgroundBrush" StartPoint="0.062,0.096" EndPoint="0.98,0.096">
									<GradientStop Color="{StaticResource Color_029}" />
									<GradientStop Color="{StaticResource Color_027}" Offset="1" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="HScrollBarGlyphBackgroundBrush" StartPoint="0,0" EndPoint="1,0">
									<GradientStop Offset="0" Color="{StaticResource Color_026}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_025}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarGlyphBackgroundBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_026}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_025}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ScrollBarThumbGlyphBackgroundBrush" Color="{StaticResource Color_025}"/>
								<LinearGradientBrush x:Key="HThumbGlyphBackgroundBrush" StartPoint="0,0" EndPoint="2,0" SpreadMethod="Repeat" MappingMode="Absolute">
									<GradientStop Color="{StaticResource Color_025}" />
									<GradientStop Color="{StaticResource Color_025}" Offset="0.60" />
									<GradientStop Color="{StaticResource Color_037}" Offset="0.60" />
									<GradientStop Color="{StaticResource Color_037}" Offset="1" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VThumbGlyphBackgroundBrush" StartPoint="1,-1" SpreadMethod="Repeat" MappingMode="Absolute">
									<LinearGradientBrush.RelativeTransform>
										<TransformGroup>
											<ScaleTransform CenterY="0.5" CenterX="0.5" />
											<SkewTransform CenterY="0.5" CenterX="0.5" />
											<RotateTransform CenterY="0.5" CenterX="0.5" />
											<TranslateTransform X="0.001" Y="0.111" />
										</TransformGroup>
									</LinearGradientBrush.RelativeTransform>
									<GradientStop Color="{StaticResource Color_025}" />
									<GradientStop Color="{StaticResource Color_025}" Offset="0.60" />
									<GradientStop Color="{StaticResource Color_037}" Offset="0.60" />
									<GradientStop Color="{StaticResource Color_037}" Offset="1" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="HScrollBarDisabledBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Color="{StaticResource Color_029}" Offset="0.016" />
									<GradientStop Offset="1" Color="{StaticResource Color_030}" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="VScrollBarDisabledBackgroundBrush" StartPoint="0.062,0.096" EndPoint="0.98,0.096">
									<GradientStop Offset="0" Color="{StaticResource Color_029}" />
									<GradientStop Offset="1" Color="{StaticResource Color_030}" />
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ComboBoxItemHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ComboBoxItemHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_018}"/>
									<GradientStop Offset="0.23" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="0.75" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_019}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ComboBoxItemHoverHighlightBorderBrush" Color="{StaticResource Color_019}"/>
								<LinearGradientBrush x:Key="ComboBoxItemPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_017}"/>
									<GradientStop Color="{StaticResource Color_016}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ComboBoxItemPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ComboBoxItemSelectedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_015}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ComboBoxItemSelectedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ComboBoxItemFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="ListBoxBackgroundBrush" Color="{StaticResource Color_032}"/>
								<SolidColorBrush x:Key="ListBoxBorderBrush" Color="{StaticResource Color_027}"/>
								<SolidColorBrush x:Key="ListBoxItemBackgroundBrush"  Color="{StaticResource Color_033}"/>
								<SolidColorBrush x:Key="ListBoxItemBorderBrush"  Color="{StaticResource Color_033}"/>
								<LinearGradientBrush x:Key="ListBoxItemHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ListBoxItemHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
									<GradientStop Offset="0" Color="{StaticResource Color_018}"/>
									<GradientStop Offset="0.23" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="0.75" Color="{StaticResource Color_017}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_019}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ListBoxItemHoverHighlightBorderBrush" Color="{StaticResource Color_019}"/>
								<LinearGradientBrush x:Key="ListBoxItemPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_017}"/>
									<GradientStop Color="{StaticResource Color_016}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ListBoxItemPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ListBoxItemSelectedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
									<GradientStop Offset="1" Color="{StaticResource Color_015}"/>
									<GradientStop Color="{StaticResource Color_014}"/>
								</LinearGradientBrush>
								<LinearGradientBrush x:Key="ListBoxItemSelectedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
									<GradientStop Offset="0" Color="{StaticResource Color_012}"/>
									<GradientStop Offset="1" Color="{StaticResource Color_013}"/>
								</LinearGradientBrush>
								<SolidColorBrush x:Key="ListBoxItemFocusedBorderBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="TextBoxBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="TextBoxBorderBrush" Color="{StaticResource Color_027}"/>
								<SolidColorBrush x:Key="TextBoxHoverBorderBrush" Color="{StaticResource Color_014}"/>
								<SolidColorBrush x:Key="TextBoxFocusedBrush" Color="{StaticResource Color_013}"/>
								<SolidColorBrush x:Key="TextBoxEditableBorderBrush" Color="{StaticResource Color_027}"/>
								<SolidColorBrush x:Key="TextBoxSelectionBackgroundBrush" Color="{StaticResource Color_013}" Opacity="0.4"/>
								<SolidColorBrush x:Key="TextBoxSelectionForegroundBrush" Color="{StaticResource Color_1021}" Opacity="0.8"/>
								<SolidColorBrush x:Key="TextBoxReadOnlyBackgroundBrush" Color="{StaticResource Color_032}"/>
								<SolidColorBrush x:Key="TextBoxReadOnlyBorderBrush" Color="{StaticResource Color_029}"/>
								<SolidColorBrush x:Key="TextBoxDisabledBorderBrush" Color="{StaticResource Color_030}"/>
								<SolidColorBrush x:Key="GlyphBackgroundBrush" Color="{StaticResource Color_005}"/>
								<SolidColorBrush x:Key="GlyphBorderBrush" Color="{StaticResource Color_025}"/>
								<SolidColorBrush x:Key="GlyphFocusedBackgroundBrush" Color="{StaticResource Color_024}"/>
								<LinearGradientBrush x:Key="ArrowBackgroundBrush" EndPoint="0.5,1" StartPoint="0.5,0">
									<GradientStop Offset="1" Color="{StaticResource Color_026}" />
									<GradientStop Color="{StaticResource Color_025}" />
								</LinearGradientBrush>
								<ControlTemplate x:Key="ValidationToolTipTemplate">
									<Grid x:Name="Root" Margin="5,0" RenderTransformOrigin="0,0" Opacity="0">
										<Grid.RenderTransform>
											<TranslateTransform x:Name="xform" X="-25" />
										</Grid.RenderTransform>
										<VisualStateManager.VisualStateGroups>
											<VisualStateGroup x:Name="OpenStates">
												<VisualStateGroup.Transitions>
													<VisualTransition GeneratedDuration="0" />
													<VisualTransition GeneratedDuration="0:0:0.2" To="Open">
														<Storyboard>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetName="xform" Storyboard.TargetProperty="X">
																<SplineDoubleKeyFrame KeyTime="0:0:0.2" Value="0" />
															</DoubleAnimationUsingKeyFrames>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
																<SplineDoubleKeyFrame KeyTime="0:0:0.2" Value="1" />
															</DoubleAnimationUsingKeyFrames>
														</Storyboard>
													</VisualTransition>
												</VisualStateGroup.Transitions>
												<VisualState x:Name="Closed">
													<Storyboard>
														<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
															<SplineDoubleKeyFrame KeyTime="0" Value="0" />
														</DoubleAnimationUsingKeyFrames>
													</Storyboard>
												</VisualState>
												<VisualState x:Name="Open">
													<Storyboard>
														<DoubleAnimationUsingKeyFrames Storyboard.TargetName="xform" Storyboard.TargetProperty="X">
															<SplineDoubleKeyFrame KeyTime="0" Value="0" />
														</DoubleAnimationUsingKeyFrames>
														<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
															<SplineDoubleKeyFrame KeyTime="0" Value="1" />
														</DoubleAnimationUsingKeyFrames>
													</Storyboard>
												</VisualState>
											</VisualStateGroup>
											<VisualStateGroup x:Name="ValidationStates">
												<VisualState x:Name="Valid" />
												<VisualState x:Name="InvalidFocused" />
												<VisualState x:Name="InvalidUnfocused" />
											</VisualStateGroup>
										</VisualStateManager.VisualStateGroups>
										<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="5" Margin="4,4,-4,-4" Opacity="0.01" />
										<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="4" Margin="3,3,-3,-3" Opacity="0.04" />
										<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="3" Margin="2,2,-2,-2" Opacity="0.10" />
										<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="2" Margin="1,1,-1,-1" Opacity="0.15" />
										<Border Background="{StaticResource ValidationErrorBrush}">
											<TextBlock UseLayoutRounding="false" Foreground="{StaticResource LightForegroundBrush}" Margin="8,4,8,4" MaxWidth="250" TextWrapping="Wrap" Text="{Binding Path=(Validation.Errors)[0].ErrorContent}" />
										</Border>
									</Grid>
								</ControlTemplate>
								<Style x:Key="BaseButtonStyle" TargetType="Button">
									<Setter Property="Background" Value="{StaticResource ButtonBackgroundBrush}"/>
									<Setter Property="BorderBrush" Value="{StaticResource ButtonBorderBrush}"/>
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="Padding" Value="3"/>
									<Setter Property="Cursor" Value="Hand"/>
									<Setter Property="BorderThickness" Value="1"/>
								</Style>
								<Style x:Key="ButtonStyle" BasedOn="{StaticResource BaseButtonStyle}" TargetType="Button">
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="Button">
												<Grid>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="Background">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBackgroundBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="BorderBrush">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBorderBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetName="ButtonHighlight" Storyboard.TargetProperty="Opacity">
																		<SplineDoubleKeyFrame KeyTime="0" Value="1"/>
																	</DoubleAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Pressed">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="Background">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBackgroundBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="BorderBrush">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBorderBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetName="DisabledVisualElement" Storyboard.TargetProperty="Opacity">
																		<SplineDoubleKeyFrame KeyTime="0" Value="0.6"/>
																	</DoubleAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="FocusedVisualElement" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Border x:Name="BaseShape" CornerRadius="3" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" />
													<Rectangle x:Name="ButtonHighlight" Margin="1" RadiusX="2" RadiusY="2" Stroke="{StaticResource ButtonHoverHighlightBorderBrush}" StrokeThickness="1" Grid.ColumnSpan="2" Opacity="0"/>
													<ContentPresenter x:Name="contentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" Content="{TemplateBinding Content}" ContentTemplate="{TemplateBinding ContentTemplate}"/>
													<Rectangle x:Name="FocusedVisualElement" Stroke="{StaticResource ButtonFocusedBorderBrush}" StrokeThickness="1"  RadiusX="3" RadiusY="3" Opacity="0"/>
													<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" RadiusX="3" RadiusY="3" Opacity="0"/>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
								<Style x:Key="CheckBoxStyle" TargetType="CheckBox">
									<Setter Property="Background" Value="{StaticResource CheckBoxBackgroundBrush}"/>
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="HorizontalContentAlignment" Value="Left"/>
									<Setter Property="VerticalContentAlignment" Value="Top"/>
									<Setter Property="Padding" Value="4,1,0,0"/>
									<Setter Property="BorderThickness" Value="1"/>
									<Setter Property="BorderBrush" Value="{StaticResource CheckBoxBorderBrush}"/>
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="CheckBox">
												<Grid >
													<Grid.ColumnDefinitions>
														<ColumnDefinition Width="16"/>
														<ColumnDefinition Width="*"/>
													</Grid.ColumnDefinitions>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="hover" d:IsOptimized="True"/>
																	<DoubleAnimation Duration="0" To="0.6" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="hoverBoxMiddle" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Pressed">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="pressed" d:IsOptimized="True"/>
																	<DoubleAnimation Duration="0" To="0.6" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="pressedBoxMiddle" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimation Duration="0" To=".55" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="contentPresenter"/>
																	<DoubleAnimation Duration="0" To="0.6" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="DisabledVisualElement"/>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="CheckStates">
															<VisualState x:Name="Checked">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="CheckIcon"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unchecked"/>
															<VisualState x:Name="Indeterminate">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="IndeterminateIcon"/>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="Opacity" Storyboard.TargetName="ContentFocusVisualElement"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="ValidationStates">
															<VisualState x:Name="Valid"/>
															<VisualState x:Name="InvalidUnfocused">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="Visibility" Storyboard.TargetName="ValidationErrorElement">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="InvalidFocused">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="Visibility" Storyboard.TargetName="ValidationErrorElement">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="IsOpen" Storyboard.TargetName="validationTooltip">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<System:Boolean>True</System:Boolean>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Grid HorizontalAlignment="Left" VerticalAlignment="Top">
														<Rectangle x:Name="normal" Fill="{TemplateBinding Background}" Height="14" Margin="1" Stroke="{TemplateBinding BorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}" Width="14"/>
														<Rectangle x:Name="normalBoxMiddle" Opacity="0.9" Height="10" StrokeThickness="1" Width="10" Fill="{StaticResource CheckBoxInnerBackgroundBrush}" Stroke="{StaticResource CheckBoxInnerBorderBrush}"/>
														<Rectangle x:Name="hover" Fill="{StaticResource CheckBoxHoverBackgroundBrush}" Height="14" Margin="1" StrokeThickness="{TemplateBinding BorderThickness}" Width="14" Stroke="{StaticResource CheckBoxHoverBorderBrush}" Opacity="0"/>
														<Rectangle x:Name="hoverBoxMiddle" Height="10" StrokeThickness="1" Width="10" Opacity="0" Fill="{StaticResource CheckBoxInnerHoverBackgroundBrush}" Stroke="{StaticResource CheckBoxInnerHoverBorderBrush}"/>
														<Rectangle x:Name="pressed" Fill="{StaticResource CheckBoxPressedBackgroundBrush}" Height="14" Margin="1" StrokeThickness="{TemplateBinding BorderThickness}" Width="14" Stroke="{StaticResource CheckBoxPressedBorderBrush}" Opacity="0"/>
														<Rectangle x:Name="pressedBoxMiddle" Height="10" StrokeThickness="1" Width="10" Opacity="0" Fill="{StaticResource CheckBoxPressedInnerBackgroundBrush}" Stroke="{StaticResource CheckBoxPressedInnerBorderBrush}"/>
														<Path x:Name="CheckIcon" Data="M103.10625,598.38019 C103.10625,598.38019 104.35281,597.37262 104.35281,597.37262 C104.35281,597.37262 106.69083,599.42383 106.69083,599.42383 C106.69083,599.42383 110.9969,593.85394 110.9969,593.85394 C110.9969,593.85394 112.8087,593.86188 112.8087,593.86188 C112.8087,593.86188 107.73771,601.85333 107.73771,601.85333 C107.73771,601.85333 106.1218,601.8479 106.1218,601.8479 C106.1218,601.8479 103.10625,598.38019 103.10625,598.38019 z" Fill="{StaticResource CheckBoxCheckIconBackgroundBrush}" FlowDirection="LeftToRight" Opacity="0" Stretch="Fill" UseLayoutRounding="False" Width="8" Height="8"/>
														<Rectangle x:Name="IndeterminateIcon" Fill="{StaticResource CheckBoxIndeterminateIconBackgroundBrush}" Height="2" Opacity="0" Width="6"/>
														<Rectangle x:Name="ContentFocusVisualElement" Height="14" IsHitTestVisible="false" Opacity="0" Stroke="{StaticResource CheckBoxFocusedBorderBrush}" StrokeThickness="1" Width="14"/>
														<Border x:Name="ValidationErrorElement" Height="16" BorderBrush="{StaticResource ValidationErrorBrush}" BorderThickness="1" ToolTipService.PlacementTarget="{Binding RelativeSource={RelativeSource TemplatedParent}}" Visibility="Collapsed">
															<ToolTipService.ToolTip>
																<ToolTip x:Name="validationTooltip" DataContext="{Binding RelativeSource={RelativeSource TemplatedParent}}" Placement="Right" PlacementTarget="{Binding RelativeSource={RelativeSource TemplatedParent}}" >
																	<ToolTip.Triggers>
																		<EventTrigger RoutedEvent="Canvas.Loaded">
																			<BeginStoryboard>
																				<Storyboard>
																					<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="IsHitTestVisible" Storyboard.TargetName="validationTooltip">
																						<DiscreteObjectKeyFrame KeyTime="0">
																							<DiscreteObjectKeyFrame.Value>
																								<System:Boolean>true</System:Boolean>
																							</DiscreteObjectKeyFrame.Value>
																						</DiscreteObjectKeyFrame>
																					</ObjectAnimationUsingKeyFrames>
																				</Storyboard>
																			</BeginStoryboard>
																		</EventTrigger>
																	</ToolTip.Triggers>
																</ToolTip>
															</ToolTipService.ToolTip>
															<Grid Background="{StaticResource TransparentBrush}" HorizontalAlignment="Right" Height="10" Margin="0,-4,-4,0" VerticalAlignment="Top" Width="10">
																<Path Data="M 1,0 L5,0 A 2,2 90 0 1 7,2 L7,6 z" Fill="{StaticResource ValidationErrorBrush}" Margin="0,3,0,0"/>
															</Grid>
														</Border>
														<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" Height="14" Opacity="0" Width="14"/>
													</Grid>
													<ContentPresenter x:Name="contentPresenter" ContentTemplate="{TemplateBinding ContentTemplate}" Content="{TemplateBinding Content}" Grid.Column="1" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
								<Style x:Key="RadioButtonStyle" TargetType="RadioButton">
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="Background" Value="{StaticResource RadioButtonBackgroundBrush}"/>
									<Setter Property="BorderBrush" Value="{StaticResource RadioButtonBorderBrush}"/>
									<Setter Property="HorizontalContentAlignment" Value="Left"/>
									<Setter Property="VerticalContentAlignment" Value="Center"/>
									<Setter Property="Padding" Value="4,1,0,0"/>
									<Setter Property="BorderThickness" Value="1"/>
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="RadioButton">
												<Grid>
													<Grid.ColumnDefinitions>
														<ColumnDefinition Width="16"/>
														<ColumnDefinition Width="*"/>
													</Grid.ColumnDefinitions>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="hoverBd">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Pressed">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="hoverBd">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimation Duration="0" To=".55" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="contentPresenter"/>
																	<DoubleAnimation Duration="0" To="0.6" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="DisabledVisualElement"/>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="CheckStates">
															<VisualState x:Name="Checked">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="check">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unchecked"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="ContentFocusVisualElement" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="ValidationStates">
															<VisualState x:Name="Valid"/>
															<VisualState x:Name="InvalidUnfocused"/>
															<VisualState x:Name="InvalidFocused"/>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Grid x:Name="Bd">
														<Ellipse Width="13" Height="13" Fill="{TemplateBinding Background}" Stroke="{TemplateBinding BorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
														<Ellipse Width="9" Height="9" Fill="{StaticResource RadioButtonInnerBackgroundBrush}" Stroke="{StaticResource RadioButtonInnerBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
													</Grid>
													<Grid x:Name="hoverBd" Visibility="Collapsed">
														<Ellipse Width="13" Height="13" Fill="{StaticResource RadioButtonHoverBackgroundBrush}" Stroke="{StaticResource RadioButtonHoverBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
														<Ellipse Width="9" Height="9" Fill="{StaticResource RadioButtonInnerHoverBackgroundBrush}" Stroke="{StaticResource RadioButtonInnerHoverBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
													</Grid>
													<Grid x:Name="pressedBd" Visibility="Collapsed">
														<Ellipse Width="13" Height="13" Fill="{StaticResource RadioButtonPressedBackgroundBrush}"  Stroke="{StaticResource RadioButtonPressedBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
														<Ellipse Width="9" Height="9" Fill="{StaticResource RadioButtonPressedInnerBackgroundBrush}" Stroke="{StaticResource RadioButtonPressedInnerBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}"/>
													</Grid>
													<Grid x:Name="check" Visibility="Collapsed">
														<Ellipse Width="9" Height="9" Stroke="{StaticResource RadioButtonCheckIconBorderBrush}" StrokeThickness="1" Fill="{StaticResource RadioButtonCheckIconBackgroundBrush}" />
													</Grid>
													<ContentPresenter x:Name="contentPresenter" ContentTemplate="{TemplateBinding ContentTemplate}" Content="{TemplateBinding Content}" Grid.Column="1" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}"/>
													<Ellipse x:Name="ContentFocusVisualElement" Height="13" Width="13" IsHitTestVisible="false" Opacity="0" Stroke="{StaticResource RadioButtonFocusedBorderBrush}" StrokeThickness="1"/>
													<Ellipse x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" Height="13" Width="13" Opacity="0"/>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
								<Style x:Key="ComboBoxItemStyle" TargetType="ComboBoxItem">
									<Setter Property="Padding" Value="5,3,5,3"/>
									<Setter Property="HorizontalContentAlignment" Value="Left"/>
									<Setter Property="VerticalContentAlignment" Value="Center"/>
									<Setter Property="Background" Value="{StaticResource TransparentBrush}"/>
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="BorderThickness" Value="1"/>
									<Setter Property="Height" Value="22" />
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="ComboBoxItem">
												<Grid Background="{TemplateBinding Background}" >
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="hoverBorder">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="0.5" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="contentPresenter" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="SelectionStates">
															<VisualState x:Name="Unselected"/>
															<VisualState x:Name="Selected">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="SelectedBorder">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="SelectedUnfocused"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="FocusVisualElement">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="LayoutStates">
															<VisualState x:Name="AfterLoaded"/>
															<VisualState x:Name="BeforeLoaded"/>
															<VisualState x:Name="BeforeUnloaded"/>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Border x:Name="hoverBorder" Background="{StaticResource ComboBoxItemHoverBackgroundBrush}" BorderBrush="{StaticResource ComboBoxItemHoverBorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Visibility="Collapsed" CornerRadius="2">
														<Rectangle Stroke="{StaticResource ComboBoxItemHoverHighlightBorderBrush}" StrokeThickness="1" RadiusX="1" RadiusY="1"/>
													</Border>
													<Border x:Name="SelectedBorder" Background="{StaticResource ComboBoxItemSelectedBackgroundBrush}" BorderBrush="{StaticResource ComboBoxItemSelectedBorderBrush}" CornerRadius="2" BorderThickness="{TemplateBinding BorderThickness}" Visibility="Collapsed" IsHitTestVisible="False"/>
													<Rectangle x:Name="FocusVisualElement" Stroke="{StaticResource ComboBoxItemFocusedBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}" Visibility="Collapsed" RadiusX="2" RadiusY="2"/>
													<ContentPresenter x:Name="contentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}"/>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
								<Style x:Key="ComboBoxToggleButtonStyle" TargetType="ToggleButton">
									<Setter Property="Background" Value="{StaticResource ButtonBackgroundBrush}"/>
									<Setter Property="BorderBrush" Value="{StaticResource ButtonBorderBrush}"/>
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="BorderThickness" Value="1"/>
									<Setter Property="Padding" Value="2"/>
									<Setter Property="Cursor" Value="Hand"/>
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="ToggleButton">
												<Grid>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="Background">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBackgroundBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="BorderBrush">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBorderBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetName="ButtonHighlight" Storyboard.TargetProperty="Opacity">
																		<SplineDoubleKeyFrame KeyTime="0" Value="1"/>
																	</DoubleAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Pressed">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="Background">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBackgroundBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="BorderBrush">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBorderBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetName="DisabledVisualElement" Storyboard.TargetProperty="Opacity">
																		<SplineDoubleKeyFrame KeyTime="0" Value="0.6"/>
																	</DoubleAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="CheckStates">
															<VisualState x:Name="Checked">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="checkedBd">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unchecked"/>
															<VisualState x:Name="Indeterminate"/>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="FocusedVisualElement" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Grid.ColumnDefinitions>
														<ColumnDefinition Width="*"/>
														<ColumnDefinition Width="14"/>
													</Grid.ColumnDefinitions>
													<Rectangle x:Name="Bd" Fill="{StaticResource TransparentBrush}" Grid.ColumnSpan="2" />
													<Grid Grid.Column="1">
														<Border x:Name="Background" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" />
														<Rectangle x:Name="ButtonHighlight" Margin="1" Stroke="{StaticResource ButtonHoverHighlightBorderBrush}" StrokeThickness="1" Grid.ColumnSpan="2" Opacity="0"/>
														<Border x:Name="checkedBd" BorderBrush="{StaticResource ButtonPressedBorderBrush}" BorderThickness="1" Background="{StaticResource ButtonPressedBackgroundBrush}" Visibility="Collapsed"/>
														<ContentPresenter x:Name="contentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" Content="{TemplateBinding Content}" ContentTemplate="{TemplateBinding ContentTemplate}"/>
														<Rectangle x:Name="FocusedVisualElement" Stroke="{StaticResource ButtonFocusedBorderBrush}" StrokeThickness="1" Opacity="0"/>
														<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" Opacity="0"/>
													</Grid>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
								<Style x:Key="ListBoxItemStyle" TargetType="ListBoxItem">
									<Setter Property="Background" Value="{StaticResource ListBoxItemBackgroundBrush}"/>
									<Setter Property="BorderBrush" Value="{StaticResource ListBoxItemBorderBrush}"/>
									<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}"/>
									<Setter Property="Padding" Value="3"/>
									<Setter Property="Margin" Value="0"/>
									<Setter Property="HorizontalContentAlignment" Value="Stretch"/>
									<Setter Property="VerticalContentAlignment" Value="Stretch"/>
									<Setter Property="BorderThickness" Value="1"/>
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="ListBoxItem">
												<Grid>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualState x:Name="Normal"/>
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="Background">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ListBoxItemHoverBackgroundBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="BorderBrush">
																		<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ListBoxItemHoverBorderBrush}"/>
																	</ObjectAnimationUsingKeyFrames>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="Highlight">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled">
																<Storyboard>
																	<DoubleAnimation Duration="0" To="0.5" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="contentPresenter" d:IsOptimized="True"/>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="SelectionStates">
															<VisualState x:Name="Unselected"/>
															<VisualState x:Name="Selected">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="SelectedBorder">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="SelectedUnfocused">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="SelectedBorder">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
														</VisualStateGroup>
														<VisualStateGroup x:Name="FocusStates">
															<VisualState x:Name="Focused">
																<Storyboard>
																	<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="FocusedVisualElement">
																		<DiscreteObjectKeyFrame KeyTime="0">
																			<DiscreteObjectKeyFrame.Value>
																				<Visibility>Visible</Visibility>
																			</DiscreteObjectKeyFrame.Value>
																		</DiscreteObjectKeyFrame>
																	</ObjectAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Unfocused"/>
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Border x:Name="BaseShape" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
														<Rectangle x:Name="Highlight" Stroke="{StaticResource ListBoxItemHoverHighlightBorderBrush}" StrokeThickness="1" Visibility="Collapsed"/>
													</Border>
													<Rectangle x:Name="SelectedBorder" Fill="{StaticResource ListBoxItemSelectedBackgroundBrush}" Stroke="{StaticResource ListBoxItemSelectedBorderBrush}" Visibility="Collapsed"/>
													<ContentPresenter x:Name="contentPresenter" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}"/>
													<Rectangle x:Name="FocusedVisualElement" IsHitTestVisible="False" Visibility="Collapsed" Stroke="{StaticResource ListBoxItemFocusedBorderBrush}" StrokeThickness="1"/>
												</Grid>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Style>
							</ResourceDictionary>
						</ResourceDictionary.MergedDictionaries>
						<Style x:Key="VScrollBarPageButton" TargetType="{x:Type RepeatButton}">
							<Setter Property="OverridesDefaultStyle" Value="true" />
							<Setter Property="Background" Value="Transparent" />
							<Setter Property="Focusable" Value="false" />
							<Setter Property="IsTabStop" Value="false" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type RepeatButton}">
										<Rectangle Fill="{TemplateBinding Background}" Height="{TemplateBinding Height}" Width="{TemplateBinding Width}">
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver" />
													<VisualState x:Name="Pressed" />
													<VisualState x:Name="Disabled" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
										</Rectangle>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="HScrollBarThumb" TargetType="{x:Type Thumb}">
							<Setter Property="OverridesDefaultStyle" Value="true" />
							<Setter Property="IsTabStop" Value="false" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type Thumb}">
										<Grid Margin="0" >
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="highlight">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{x:Static Visibility.Visible}" />
															</ObjectAnimationUsingKeyFrames>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Bd" Storyboard.TargetProperty="Background">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource HScrollBarButtonlHoverBackgroundBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Pressed">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Duration="0" Storyboard.TargetProperty="Background" Storyboard.TargetName="Bd">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource HScrollBarButtonlPressedBackgroundBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Disabled" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border x:Name="Bd" Background="{StaticResource HScrollBarButtonlBackgroundBrush}" BorderBrush="{StaticResource ScrollBarButtonlBorderBrush}" BorderThickness="1" CornerRadius="1">
												<Rectangle x:Name="highlight" Stroke="{StaticResource ScrollBarButtonlHighlightBackgroundBrush}" Visibility="Collapsed" />
											</Border>
											<Rectangle Fill="{StaticResource HThumbGlyphBackgroundBrush}" Margin="2.4,0" Height="7" MinWidth="3" MaxWidth="7" />
										</Grid>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="VScrollBarThumb" TargetType="{x:Type Thumb}">
							<Setter Property="Stylus.IsPressAndHoldEnabled" Value="false" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type Thumb}">
										<Grid x:Name="grid" Height="Auto" Width="Auto" >
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="highlight">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{x:Static Visibility.Visible}" />
															</ObjectAnimationUsingKeyFrames>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Bd" Storyboard.TargetProperty="Background">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource VScrollBarButtonlHoverBackgroundBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Pressed">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Duration="0" Storyboard.TargetProperty="Background" Storyboard.TargetName="Bd">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource VScrollBarButtonlPressedBackgroundBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Disabled" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border x:Name="Bd" Background="{StaticResource VScrollBarButtonlBackgroundBrush}" BorderBrush="{StaticResource ScrollBarButtonlBorderBrush}" BorderThickness="1" CornerRadius="1">
												<Rectangle x:Name="highlight" Stroke="{StaticResource ScrollBarButtonlHighlightBackgroundBrush}" Visibility="Collapsed" />
											</Border>
											<Rectangle Fill="{StaticResource VThumbGlyphBackgroundBrush}" Margin="2.4,0" Height="7" MinWidth="3" MaxWidth="7" />
										</Grid>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="ScrollBarPageButtonStyle" TargetType="{x:Type RepeatButton}">
							<Setter Property="OverridesDefaultStyle" Value="true" />
							<Setter Property="Background" Value="Transparent" />
							<Setter Property="Focusable" Value="false" />
							<Setter Property="IsTabStop" Value="false" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type RepeatButton}">
										<Rectangle Fill="{TemplateBinding Background}" Height="{TemplateBinding Height}" Width="{TemplateBinding Width}" />
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="ScrollBarButtonStyle" TargetType="{x:Type RepeatButton}">
							<Setter Property="OverridesDefaultStyle" Value="true" />
							<Setter Property="Focusable" Value="false" />
							<Setter Property="IsTabStop" Value="false" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type RepeatButton}">
										<Grid x:Name="grid1" >
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver" />
													<VisualState x:Name="Pressed">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Bd" Storyboard.TargetProperty="Background">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource HScrollBarButtonlPressedBackgroundBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Disabled" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border x:Name="Bd" Background="{StaticResource HScrollBarButtonlBackgroundBrush}" BorderBrush="{StaticResource ScrollBarButtonlBorderBrush}" BorderThickness="1" CornerRadius="1" Margin="0">
												<Rectangle x:Name="highlight" Stroke="{StaticResource ScrollBarButtonlHighlightBackgroundBrush}" Visibility="Collapsed" />
											</Border>
											<ContentPresenter x:Name="contentPresenter" Margin="0" />
										</Grid>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="ScrollBarStyle" TargetType="{x:Type ScrollBar}">
							<Setter Property="Background" Value="{StaticResource VScrollBarTrackBackgroundBrush}" />
							<Setter Property="BorderBrush" Value="{StaticResource ScrollBarTrackBorderBrush}" />
							<Setter Property="Stylus.IsPressAndHoldEnabled" Value="false" />
							<Setter Property="Stylus.IsFlicksEnabled" Value="false" />
							<Setter Property="Width" Value="{DynamicResource {x:Static SystemParameters.VerticalScrollBarWidthKey}}" />
							<Setter Property="MinWidth" Value="{DynamicResource {x:Static SystemParameters.VerticalScrollBarWidthKey}}" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type ScrollBar}">
										<Grid x:Name="Bg">
											<Grid.RowDefinitions>
												<RowDefinition MaxHeight="{DynamicResource {x:Static SystemParameters.VerticalScrollBarButtonHeightKey}}" />
												<RowDefinition Height="0.00001*" />
												<RowDefinition MaxHeight="{DynamicResource {x:Static SystemParameters.VerticalScrollBarButtonHeightKey}}" />
											</Grid.RowDefinitions>
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualStateGroup.Transitions>
														<VisualTransition GeneratedDuration="0:0:0.3" />
													</VisualStateGroup.Transitions>
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver">
														<Storyboard>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton">
																<EasingDoubleKeyFrame KeyTime="0" Value="1" />
															</DoubleAnimationUsingKeyFrames>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton1">
																<EasingDoubleKeyFrame KeyTime="0" Value="1" />
															</DoubleAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Disabled">
														<Storyboard>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton">
																<EasingDoubleKeyFrame KeyTime="0" Value="0.6" />
															</DoubleAnimationUsingKeyFrames>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton1">
																<EasingDoubleKeyFrame KeyTime="0" Value="0.6" />
															</DoubleAnimationUsingKeyFrames>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="thumb">
																<EasingDoubleKeyFrame KeyTime="0" Value="0" />
															</DoubleAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border Grid.RowSpan="3" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="0,1" CornerRadius="0" Height="Auto" Margin="0" Grid.Row="0" VerticalAlignment="Stretch" />
											<RepeatButton x:Name="repeatButton" Margin="1,1,1,0" Command="{x:Static ScrollBar.LineUpCommand}" IsEnabled="{TemplateBinding IsMouseOver}" Style="{StaticResource ScrollBarButtonStyle}" Opacity="0" />
											<Path x:Name="smallDecreaseGlyph" Width="9" Height="5" Fill="{StaticResource VScrollBarGlyphBackgroundBrush}" IsHitTestVisible="False" Data="M 4,0 C4,0 4,1 4,1 4,1 3,1 3,1 3,1 3,2 3,2 3,2 2,2 2,2 2,2 2,3 2,3 2,3 1,3 1,3 1,3 1,4 1,4 1,4 0,4 0,4 0,4 0,5 0,5 0,5 9,5 9,5 9,5 9,4 9,4 9,4 8,4 8,4 8,4 8,3 8,3 8,3 7,3 7,3 7,3 7,2 7,2 7,2 6,2 6,2 6,2 6,1 6,1 6,1 5,1 5,1 5,1 5,0 5,0 5,0 4,0 4,0 z" HorizontalAlignment="Center" VerticalAlignment="Center" />
											<Track x:Name="PART_Track" IsDirectionReversed="true" IsEnabled="{TemplateBinding IsMouseOver}" Grid.Row="1">
												<Track.DecreaseRepeatButton>
													<RepeatButton Command="{x:Static ScrollBar.PageUpCommand}" Style="{StaticResource ScrollBarPageButtonStyle}" />
												</Track.DecreaseRepeatButton>
												<Track.IncreaseRepeatButton>
													<RepeatButton Command="{x:Static ScrollBar.PageDownCommand}" Style="{StaticResource ScrollBarPageButtonStyle}" />
												</Track.IncreaseRepeatButton>
												<Track.Thumb>
													<Thumb x:Name="thumb" Margin="1,0" Style="{StaticResource VScrollBarThumb}" />
												</Track.Thumb>
											</Track>
											<RepeatButton x:Name="repeatButton1" Command="{x:Static ScrollBar.LineDownCommand}" IsEnabled="{TemplateBinding IsMouseOver}" Grid.Row="2" Style="{StaticResource ScrollBarButtonStyle}" Margin="1,0,1,1" Opacity="0" />
											<Path x:Name="smallIncreaseGlyph" Width="9" Height="5" IsHitTestVisible="False" HorizontalAlignment="Center" VerticalAlignment="Center" Data="M 4,5 C4,5 4,4 4,4 4,4 3,4 3,4 3,4 3,3 3,3 3,3 2,3 2,3 2,3 2,2 2,2 2,2 1,2 1,2 1,2 1,1 1,1 1,1 0,1 0,1 0,1 0,0 0,0 0,0 9,0 9,0 9,0 9,1 9,1 9,1 8,1 8,1 8,1 8,2 8,2 8,2 7,2 7,2 7,2 7,3 7,3 7,3 6,3 6,3 6,3 6,4 6,4 6,4 5,4 5,4 5,4 5,5 5,5 5,5 4,5 4,5 z" Grid.Row="2" Fill="{StaticResource VScrollBarGlyphBackgroundBrush}" />
										</Grid>
										<ControlTemplate.Triggers>
											<Trigger Property="IsEnabled" Value="false">
												<Setter Property="Background" TargetName="Bg" Value="{StaticResource DisabledBackgroundBrush}" />
											</Trigger>
										</ControlTemplate.Triggers>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
							<Style.Triggers>
								<Trigger Property="Orientation" Value="Horizontal">
									<Setter Property="Width" Value="Auto" />
									<Setter Property="MinWidth" Value="0" />
									<Setter Property="Height" Value="{DynamicResource {x:Static SystemParameters.HorizontalScrollBarHeightKey}}" />
									<Setter Property="MinHeight" Value="{DynamicResource {x:Static SystemParameters.HorizontalScrollBarHeightKey}}" />
									<Setter Property="Background" Value="{StaticResource HScrollBarTrackBackgroundBrush}" />
									<Setter Property="BorderBrush" Value="{StaticResource ScrollBarTrackBorderBrush}" />
									<Setter Property="Template">
										<Setter.Value>
											<ControlTemplate TargetType="{x:Type ScrollBar}">
												<Grid x:Name="Bg" Background="{TemplateBinding Background}" >
													<Grid.ColumnDefinitions>
														<ColumnDefinition MaxWidth="{DynamicResource {x:Static SystemParameters.HorizontalScrollBarButtonWidthKey}}" />
														<ColumnDefinition Width="0.00001*" />
														<ColumnDefinition MaxWidth="{DynamicResource {x:Static SystemParameters.HorizontalScrollBarButtonWidthKey}}" />
													</Grid.ColumnDefinitions>
													<VisualStateManager.VisualStateGroups>
														<VisualStateGroup x:Name="CommonStates">
															<VisualStateGroup.Transitions>
																<VisualTransition GeneratedDuration="0:0:0.3" />
															</VisualStateGroup.Transitions>
															<VisualState x:Name="Normal" />
															<VisualState x:Name="MouseOver">
																<Storyboard>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton">
																		<EasingDoubleKeyFrame KeyTime="0" Value="1" />
																	</DoubleAnimationUsingKeyFrames>
																	<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="repeatButton1">
																		<EasingDoubleKeyFrame KeyTime="0" Value="1" />
																	</DoubleAnimationUsingKeyFrames>
																</Storyboard>
															</VisualState>
															<VisualState x:Name="Disabled" />
														</VisualStateGroup>
													</VisualStateManager.VisualStateGroups>
													<Border Grid.ColumnSpan="3" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="1,0" Margin="0" />
													<RepeatButton x:Name="repeatButton" Command="{x:Static ScrollBar.LineLeftCommand}" IsEnabled="{TemplateBinding IsMouseOver}" Style="{StaticResource ScrollBarButtonStyle}" Opacity="0" Margin="1,1,0,1" />
													<Path x:Name="horizontalSmallDecreaseGlyph" Width="5" Height="9" Fill="{StaticResource HScrollBarGlyphBackgroundBrush}" IsHitTestVisible="False" Data="M 0,4 C0,4 1,4 1,4 1,4 1,3 1,3 1,3 2,3 2,3 2,3 2,2 2,2 2,2 3,2 3,2 3,2 3,1 3,1 3,1 4,1 4,1 4,1 4,0 4,0 4,0 5,0 5,0 5,0 5,9 5,9 5,9 4,9 4,9 4,9 4,8 4,8 4,8 3,8 3,8 3,8 3,7 3,7 3,7 2,7 2,7 2,7 2,6 2,6 2,6 1,6 1,6 1,6 1,5 1,5 1,5 0,5 0,5 0,5 0,4 0,4 z" HorizontalAlignment="Center" Margin="0" VerticalAlignment="Center" />
													<Track x:Name="PART_Track" Grid.Column="1" IsEnabled="{TemplateBinding IsMouseOver}">
														<Track.DecreaseRepeatButton>
															<RepeatButton Command="{x:Static ScrollBar.PageLeftCommand}" Style="{StaticResource ScrollBarPageButtonStyle}" />
														</Track.DecreaseRepeatButton>
														<Track.IncreaseRepeatButton>
															<RepeatButton Command="{x:Static ScrollBar.PageRightCommand}" Style="{StaticResource ScrollBarPageButtonStyle}" />
														</Track.IncreaseRepeatButton>
														<Track.Thumb>
															<Thumb Style="{StaticResource HScrollBarThumb}" Margin="0,1" />
														</Track.Thumb>
													</Track>
													<RepeatButton x:Name="repeatButton1" Grid.Column="2" Command="{x:Static ScrollBar.LineRightCommand}" IsEnabled="{TemplateBinding IsMouseOver}" Style="{StaticResource ScrollBarButtonStyle}" Opacity="0" Margin="0,1,1,1" />
													<Path x:Name="horizontalSmallIncreaseGlyph" Width="5" Height="9" Fill="{StaticResource HScrollBarGlyphBackgroundBrush}" IsHitTestVisible="False" HorizontalAlignment="Center" Data="M 5,4 C5,4 4,4 4,4 4,4 4,3 4,3 4,3 3,3 3,3 3,3 3,2 3,2 3,2 2,2 2,2 2,2 2,1 2,1 2,1 1,1 1,1 1,1 1,0 1,0 1,0 0,0 0,0 0,0 0,9 0,9 0,9 1,9 1,9 1,9 1,8 1,8 1,8 2,8 2,8 2,8 2,7 2,7 2,7 3,7 3,7 3,7 3,6 3,6 3,6 4,6 4,6 4,6 4,5 4,5 4,5 5,5 5,5 5,5 5,4 5,4 z" Margin="0" VerticalAlignment="Center" Grid.Column="2" />
												</Grid>
												<ControlTemplate.Triggers>
													<Trigger Property="IsEnabled" Value="false">
														<Setter Property="Background" TargetName="Bg" Value="{StaticResource DisabledBackgroundBrush}" />
													</Trigger>
												</ControlTemplate.Triggers>
											</ControlTemplate>
										</Setter.Value>
									</Setter>
								</Trigger>
							</Style.Triggers>
						</Style>
						<Style x:Key="ScrollViewerStyle" TargetType="{x:Type ScrollViewer}">
							<Setter Property="HorizontalContentAlignment" Value="Left" />
							<Setter Property="VerticalContentAlignment" Value="Top" />
							<Setter Property="VerticalScrollBarVisibility" Value="Auto" />
							<Setter Property="Padding" Value="0" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type ScrollViewer}">
										<Border>
											<Grid Background="{TemplateBinding Background}">
												<Grid.ColumnDefinitions>
													<ColumnDefinition Width="*" />
													<ColumnDefinition Width="Auto" />
												</Grid.ColumnDefinitions>
												<Grid.RowDefinitions>
													<RowDefinition Height="*" />
													<RowDefinition Height="Auto" />
												</Grid.RowDefinitions>
												<ScrollContentPresenter x:Name="PART_ScrollContentPresenter" CanContentScroll="{TemplateBinding CanContentScroll}" CanHorizontallyScroll="False" CanVerticallyScroll="False" ContentTemplate="{TemplateBinding ContentTemplate}" Content="{TemplateBinding Content}" Grid.Column="0" Margin="{TemplateBinding Padding}" Grid.Row="0" />
												<Rectangle Grid.Column="1" Fill="{StaticResource ScrollViewerCornerBackgroundBrush}" Grid.Row="1" />
												<ScrollBar x:Name="PART_VerticalScrollBar" AutomationProperties.AutomationId="VerticalScrollBar" Cursor="Arrow" Grid.Column="1" Maximum="{TemplateBinding ScrollableHeight}" Minimum="0" Grid.Row="0" Visibility="{TemplateBinding ComputedVerticalScrollBarVisibility}" Value="{Binding VerticalOffset, Mode=OneWay, RelativeSource={RelativeSource TemplatedParent}}" ViewportSize="{TemplateBinding ViewportHeight}" Width="16" Style="{StaticResource ScrollBarStyle}" />
												<ScrollBar x:Name="PART_HorizontalScrollBar" AutomationProperties.AutomationId="HorizontalScrollBar" Cursor="Arrow" Grid.Column="0" Maximum="{TemplateBinding ScrollableWidth}" Minimum="0" Orientation="Horizontal" Grid.Row="1" Visibility="{TemplateBinding ComputedHorizontalScrollBarVisibility}" Value="{Binding HorizontalOffset, Mode=OneWay, RelativeSource={RelativeSource TemplatedParent}}" ViewportSize="{TemplateBinding ViewportWidth}" Height="16" Style="{StaticResource ScrollBarStyle}" />
											</Grid>
										</Border>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<ControlTemplate x:Key="TextBoxValidationToolTipTemplate">
							<Grid x:Name="Root" Margin="5,0" RenderTransformOrigin="0,0" Opacity="0">
								<Grid.RenderTransform>
									<TranslateTransform x:Name="xform" X="-25" />
								</Grid.RenderTransform>
								<VisualStateManager.VisualStateGroups>
									<VisualStateGroup x:Name="OpenStates">
										<VisualStateGroup.Transitions>
											<VisualTransition GeneratedDuration="0" />
											<VisualTransition GeneratedDuration="0:0:0.2" To="Open">
												<Storyboard>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="xform" Storyboard.TargetProperty="X">
														<SplineDoubleKeyFrame KeyTime="0:0:0.2" Value="0" />
													</DoubleAnimationUsingKeyFrames>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
														<SplineDoubleKeyFrame KeyTime="0:0:0.2" Value="1" />
													</DoubleAnimationUsingKeyFrames>
												</Storyboard>
											</VisualTransition>
										</VisualStateGroup.Transitions>
										<VisualState x:Name="Closed">
											<Storyboard>
												<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
													<SplineDoubleKeyFrame KeyTime="0" Value="0" />
												</DoubleAnimationUsingKeyFrames>
											</Storyboard>
										</VisualState>
										<VisualState x:Name="Open">
											<Storyboard>
												<DoubleAnimationUsingKeyFrames Storyboard.TargetName="xform" Storyboard.TargetProperty="X">
													<SplineDoubleKeyFrame KeyTime="0" Value="0" />
												</DoubleAnimationUsingKeyFrames>
												<DoubleAnimationUsingKeyFrames Storyboard.TargetName="Root" Storyboard.TargetProperty="Opacity">
													<SplineDoubleKeyFrame KeyTime="0" Value="1" />
												</DoubleAnimationUsingKeyFrames>
											</Storyboard>
										</VisualState>
									</VisualStateGroup>
									<VisualStateGroup x:Name="ValidationStates">
										<VisualState x:Name="Valid" />
										<VisualState x:Name="InvalidFocused" />
										<VisualState x:Name="InvalidUnfocused" />
									</VisualStateGroup>
								</VisualStateManager.VisualStateGroups>
								<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="5" Margin="4,4,-4,-4" Opacity="0.01" />
								<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="4" Margin="3,3,-3,-3" Opacity="0.04" />
								<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="3" Margin="2,2,-2,-2" Opacity="0.10" />
								<Border Background="{StaticResource ShadowBackgroundBrush}" CornerRadius="2" Margin="1,1,-1,-1" Opacity="0.15" />
								<Border Background="{StaticResource ValidationErrorBrush}">
									<TextBlock UseLayoutRounding="false" Foreground="{StaticResource LightForegroundBrush}" Margin="8,4,8,4" MaxWidth="250" TextWrapping="Wrap" Text="{Binding Path=(Validation.Errors).CurrentItem.ErrorContent}" />
								</Border>
							</Grid>
						</ControlTemplate>
						<Style x:Key="TextBoxStyle" TargetType="{x:Type TextBox}">
							<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
							<Setter Property="BorderBrush" Value="{StaticResource TextBoxBorderBrush}" />
							<Setter Property="Background" Value="{StaticResource TextBoxBackgroundBrush}" />
							<Setter Property="SelectionBrush" Value="{StaticResource TextBoxSelectionBackgroundBrush}" />
							<Setter Property="BorderThickness" Value="1" />
							<Setter Property="Padding" Value="4,2" />
							<Setter Property="MinHeight" Value="20" />
							<Setter Property="AllowDrop" Value="true" />
							<Setter Property="FocusVisualStyle" Value="{x:Null}" />
							<Setter Property="ScrollViewer.PanningMode" Value="VerticalFirst" />
							<Setter Property="Stylus.IsFlicksEnabled" Value="False" />
							<Setter Property="FlowDirection" Value="LeftToRight" />
							<Setter Property="Validation.ErrorTemplate" Value="{StaticResource TextBoxValidationToolTipTemplate}"/>
							<Setter Property="SelectionBrush" Value="{StaticResource TextBoxFocusedBrush}" />
							<Setter Property="SelectionOpacity" Value="0.4" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate>
										<Grid SnapsToDevicePixels="True">
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="ValidationStates">
													<VisualState x:Name="Valid"/>
													<VisualState x:Name="InvalidUnfocused">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="Visibility" Storyboard.TargetName="ValidationErrorElement">
																<DiscreteObjectKeyFrame KeyTime="0">
																	<DiscreteObjectKeyFrame.Value>
																		<Visibility>Visible</Visibility>
																	</DiscreteObjectKeyFrame.Value>
																</DiscreteObjectKeyFrame>
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="InvalidFocused">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="Visibility" Storyboard.TargetName="ValidationErrorElement">
																<DiscreteObjectKeyFrame KeyTime="0">
																	<DiscreteObjectKeyFrame.Value>
																		<Visibility>Visible</Visibility>
																	</DiscreteObjectKeyFrame.Value>
																</DiscreteObjectKeyFrame>
															</ObjectAnimationUsingKeyFrames>
															<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="IsOpen" Storyboard.TargetName="validationTooltip">
																<DiscreteObjectKeyFrame KeyTime="0">
																	<DiscreteObjectKeyFrame.Value>
																		<System:Boolean>True</System:Boolean>
																	</DiscreteObjectKeyFrame.Value>
																</DiscreteObjectKeyFrame>
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border Background="{TemplateBinding Background}" x:Name="Bd" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
												<ScrollViewer x:Name="PART_ContentHost" />
											</Border>
											<Border x:Name="ValidationErrorElement" BorderBrush="{StaticResource ValidationErrorBrush}" BorderThickness="{TemplateBinding BorderThickness}" Visibility="Collapsed">
												<ToolTipService.ToolTip>
													<ToolTip x:Name="validationTooltip" DataContext="{Binding RelativeSource={RelativeSource TemplatedParent}}" Placement="Right" PlacementTarget="{Binding RelativeSource={RelativeSource TemplatedParent}}" Template="{StaticResource TextBoxValidationToolTipTemplate}"/>
												</ToolTipService.ToolTip>
												<Grid Background="Transparent" HorizontalAlignment="Right" Height="12" Margin="1,-4,-4,0" VerticalAlignment="Top" Width="12">
													<Path Data="M 1,0 L6,0 A 2,2 90 0 1 8,2 L8,7 z" Fill="{StaticResource ValidationErrorBrush}" Margin="1,3,0,0" />
													<Path Data="M 0,0 L2,0 L 8,6 L8,8" Fill="{StaticResource LightForegroundBrush}" Margin="1,3,0,0" />
												</Grid>
											</Border>
										</Grid>
										<ControlTemplate.Triggers>
											<Trigger Property="IsEnabled" Value="False">
												<Setter Property="BorderBrush" Value="{StaticResource TextBoxDisabledBorderBrush}" TargetName="Bd" />
												<Setter Property="Foreground" Value="{StaticResource ForegroundDisabledBrush}" />
											</Trigger>
											<Trigger Property="IsMouseOver" Value="True">
												<Setter Property="BorderBrush" Value="{StaticResource TextBoxHoverBorderBrush}" TargetName="Bd" />
											</Trigger>
											<Trigger Property="IsFocused" Value="True">
												<Setter Property="BorderBrush" Value="{StaticResource TextBoxFocusedBrush}" TargetName="Bd" />
											</Trigger>
											<MultiDataTrigger>
												<MultiDataTrigger.Conditions>
													<Condition Binding="{Binding IsReadOnly, RelativeSource={RelativeSource Self}}" Value="True" />
													<Condition Binding="{Binding IsEnabled, RelativeSource={RelativeSource Self}}" Value="True" />
												</MultiDataTrigger.Conditions>
												<Setter Property="Background" Value="{StaticResource TextBoxReadOnlyBackgroundBrush}" />
												<Setter Property="BorderBrush" Value="{StaticResource TextBoxReadOnlyBorderBrush}" />
											</MultiDataTrigger>
										</ControlTemplate.Triggers>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<Style x:Key="ComboBoxEditableTextBoxStyle" TargetType="{x:Type TextBox}">
							<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
							<Setter Property="AllowDrop" Value="true" />
							<Setter Property="MinHeight" Value="24" />
							<Setter Property="Padding" Value="3,3,3,1" />
							<Setter Property="FocusVisualStyle" Value="{x:Null}" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type TextBox}">
										<ScrollViewer Style="{StaticResource ScrollViewerStyle}" x:Name="PART_ContentHost" Background="Transparent" Focusable="false" HorizontalScrollBarVisibility="Hidden" VerticalScrollBarVisibility="Hidden">
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="Disabled">
														<Storyboard>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="PART_ContentHost">
																<EasingDoubleKeyFrame KeyTime="0" Value="0.3" />
															</DoubleAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="ReadOnly" />
													<VisualState x:Name="MouseOver" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
										</ScrollViewer>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
						<ControlTemplate x:Key="ComboBoxEditableTemplate" TargetType="{x:Type ComboBox}">
							<Grid x:Name="MainGrid" >
								<VisualStateManager.VisualStateGroups>
									<VisualStateGroup x:Name="CommonStates">
										<VisualState x:Name="Normal" />
										<VisualState x:Name="MouseOver">
											<Storyboard>
												<ObjectAnimationUsingKeyFrames BeginTime="0" Duration="0" Storyboard.TargetName="ContentPresenterBorder" Storyboard.TargetProperty="(Border.BorderBrush)">
													<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource TextBoxHoverBorderBrush}" />
												</ObjectAnimationUsingKeyFrames>
											</Storyboard>
										</VisualState>
										<VisualState x:Name="Disabled">
											<Storyboard>
												<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="DisabledVisualElement">
													<EasingDoubleKeyFrame KeyTime="0" Value="0.6" />
												</DoubleAnimationUsingKeyFrames>
											</Storyboard>
										</VisualState>
									</VisualStateGroup>
									<VisualStateGroup x:Name="FocusStates">
										<VisualState x:Name="Unfocused" />
										<VisualState x:Name="Focused" />
										<VisualState x:Name="FocusedDropDown">
											<Storyboard>
												<ObjectAnimationUsingKeyFrames Duration="00:00:00" Storyboard.TargetName="DropDownBorder" Storyboard.TargetProperty="(UIElement.Visibility)">
													<DiscreteObjectKeyFrame KeyTime="00:00:00">
														<DiscreteObjectKeyFrame.Value>
															<Visibility>Visible</Visibility>
														</DiscreteObjectKeyFrame.Value>
													</DiscreteObjectKeyFrame>
												</ObjectAnimationUsingKeyFrames>
											</Storyboard>
										</VisualState>
									</VisualStateGroup>
									<VisualStateGroup x:Name="EditStates">
										<VisualState x:Name="Editable" />
										<VisualState x:Name="Uneditable" />
									</VisualStateGroup>
									<VisualStateGroup x:Name="ValidationStates">
										<VisualState x:Name="Valid" />
										<VisualState x:Name="InvalidFocused" />
										<VisualState x:Name="InvalidUnfocused" />
									</VisualStateGroup>
								</VisualStateManager.VisualStateGroups>
								<Border x:Name="ContentPresenterBorder" BorderBrush="{TemplateBinding BorderBrush}" Background="{TemplateBinding Background}" BorderThickness="{TemplateBinding BorderThickness}" />
								<Grid>
									<Grid.ColumnDefinitions>
										<ColumnDefinition Width="*" />
										<ColumnDefinition Width="15" />
									</Grid.ColumnDefinitions>
									<ToggleButton x:Name="DropDownToggle" Height="{TemplateBinding Height}" Grid.Column="1" HorizontalAlignment="Stretch" VerticalAlignment="Stretch" IsChecked="{Binding IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}" Style="{StaticResource ComboBoxToggleButtonStyle}">
										<Path x:Name="BtnArrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" />
									</ToggleButton>
									<TextBox x:Name="PART_EditableTextBox" Grid.Column="0" HorizontalContentAlignment="Left" IsReadOnly="{Binding IsReadOnly, RelativeSource={RelativeSource TemplatedParent}}" Style="{StaticResource ComboBoxEditableTextBoxStyle}" />
									<TextBlock IsHitTestVisible="False" Text=" " Margin="5,2,5,0" Visibility="Collapsed" />
								</Grid>
								<Popup x:Name="PART_Popup" Margin="1" AllowsTransparency="true" IsOpen="{Binding IsDropDownOpen, RelativeSource={RelativeSource TemplatedParent}}" Placement="Bottom" PopupAnimation="{StaticResource {x:Static SystemParameters.ComboBoxPopupAnimationKey}}" Grid.ColumnSpan="2">
									<Border x:Name="DropDownBorder" HorizontalAlignment="Stretch" Background="{StaticResource PopupBackgroundBrush}" BorderBrush="{StaticResource PopupBorderBrush}" BorderThickness="1" MaxHeight="{TemplateBinding MaxDropDownHeight}" MinWidth="{Binding ActualWidth, ElementName=MainGrid}">
										<ScrollViewer CanContentScroll="true" BorderThickness="0" Padding="1" Style="{StaticResource ScrollViewerStyle}" Margin="0">
											<ItemsPresenter SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" KeyboardNavigation.DirectionalNavigation="Contained" />
										</ScrollViewer>
									</Border>
								</Popup>
								<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" Opacity="0" Grid.ColumnSpan="2" />
							</Grid>
							<ControlTemplate.Triggers>
								<Trigger Property="HasItems" Value="false">
									<Setter Property="Height" TargetName="DropDownBorder" Value="95" />
								</Trigger>
							</ControlTemplate.Triggers>
						</ControlTemplate>
						<Style x:Key="ComboBoxStyle" TargetType="{x:Type ComboBox}">
							<Setter Property="ItemContainerStyle" Value="{StaticResource ComboBoxItemStyle}" />
							<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
							<Setter Property="Background" Value="{StaticResource TextBoxBackgroundBrush}" />
							<Setter Property="BorderBrush" Value="{StaticResource TextBoxBorderBrush}" />
							<Setter Property="HorizontalContentAlignment" Value="Left" />
							<Setter Property="Padding" Value="5,3,20,3" />
							<Setter Property="BorderThickness" Value="1" />
							<Setter Property="MinHeight" Value="24" />
							<Setter Property="Cursor" Value="Hand" />
							<Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Auto" />
							<Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto" />
							<Setter Property="ScrollViewer.CanContentScroll" Value="true" />
							<Setter Property="ScrollViewer.PanningMode" Value="Both" />
							<Setter Property="Stylus.IsFlicksEnabled" Value="False" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type ComboBox}">
										<Grid x:Name="MainGrid">
											<VisualStateManager.VisualStateGroups>
												<VisualStateGroup x:Name="CommonStates">
													<VisualState x:Name="Normal" />
													<VisualState x:Name="MouseOver">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames BeginTime="0" Duration="0" Storyboard.TargetName="ContentPresenterBorder" Storyboard.TargetProperty="(Border.BorderBrush)">
																<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource TextBoxHoverBorderBrush}" />
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
													<VisualState x:Name="Disabled">
														<Storyboard>
															<DoubleAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="DisabledVisualElement">
																<EasingDoubleKeyFrame KeyTime="0" Value="0.6" />
															</DoubleAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
												</VisualStateGroup>
												<VisualStateGroup x:Name="FocusStates">
													<VisualState x:Name="Unfocused" />
													<VisualState x:Name="Focused" />
													<VisualState x:Name="FocusedDropDown">
														<Storyboard>
															<ObjectAnimationUsingKeyFrames Duration="00:00:00" Storyboard.TargetName="DropDownBorder" Storyboard.TargetProperty="(UIElement.Visibility)">
																<DiscreteObjectKeyFrame KeyTime="00:00:00">
																	<DiscreteObjectKeyFrame.Value>
																		<Visibility>Visible</Visibility>
																	</DiscreteObjectKeyFrame.Value>
																</DiscreteObjectKeyFrame>
															</ObjectAnimationUsingKeyFrames>
														</Storyboard>
													</VisualState>
												</VisualStateGroup>
												<VisualStateGroup x:Name="EditStates">
													<VisualState x:Name="Editable" />
													<VisualState x:Name="Uneditable" />
												</VisualStateGroup>
												<VisualStateGroup x:Name="ValidationStates">
													<VisualState x:Name="Valid" />
													<VisualState x:Name="InvalidFocused" />
													<VisualState x:Name="InvalidUnfocused" />
												</VisualStateGroup>
											</VisualStateManager.VisualStateGroups>
											<Border x:Name="ContentPresenterBorder" BorderBrush="{TemplateBinding BorderBrush}" Background="{TemplateBinding Background}" BorderThickness="{TemplateBinding BorderThickness}" />
											<Grid>
												<ToggleButton IsChecked="{Binding IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}" Style="{StaticResource ComboBoxToggleButtonStyle}">
													<Path x:Name="BtnArrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" />
												</ToggleButton>
												<ContentPresenter x:Name="ContentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" IsHitTestVisible="false" SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" Content="{TemplateBinding SelectionBoxItem}" ContentTemplate="{TemplateBinding SelectionBoxItemTemplate}" ContentStringFormat="{TemplateBinding SelectionBoxItemStringFormat}" ContentTemplateSelector="{TemplateBinding ItemTemplateSelector}" />
												<TextBlock IsHitTestVisible="False" Text=" " Margin="5,2,5,0" Visibility="Collapsed" />
											</Grid>
											<Popup x:Name="PART_Popup" Margin="1" AllowsTransparency="true" IsOpen="{Binding IsDropDownOpen, RelativeSource={RelativeSource TemplatedParent}}" Placement="Bottom" PopupAnimation="{StaticResource {x:Static SystemParameters.ComboBoxPopupAnimationKey}}" Grid.ColumnSpan="2">
												<Border x:Name="DropDownBorder" HorizontalAlignment="Stretch" Background="{StaticResource PopupBackgroundBrush}" BorderBrush="{StaticResource PopupBorderBrush}" BorderThickness="1" MaxHeight="{TemplateBinding MaxDropDownHeight}" MinWidth="{Binding ActualWidth, ElementName=MainGrid}">
													<ScrollViewer CanContentScroll="true" BorderThickness="0" Padding="1" Style="{StaticResource ScrollViewerStyle}" Margin="0">
														<ItemsPresenter SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" KeyboardNavigation.DirectionalNavigation="Contained" />
													</ScrollViewer>
												</Border>
											</Popup>
											<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" Opacity="0" Grid.ColumnSpan="2" />
										</Grid>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
							<Style.Triggers>
								<Trigger Property="IsEditable" Value="true">
									<Setter Property="IsTabStop" Value="false" />
									<Setter Property="Template" Value="{StaticResource ComboBoxEditableTemplate}" />
								</Trigger>
							</Style.Triggers>
						</Style>
						<Style x:Key="ListBoxStyle" TargetType="{x:Type ListBox}">
							<Setter Property="ItemContainerStyle" Value="{StaticResource ListBoxItemStyle}" />
							<Setter Property="Background" Value="{StaticResource ListBoxBackgroundBrush}" />
							<Setter Property="BorderBrush" Value="{StaticResource ListBoxBorderBrush}" />
							<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
							<Setter Property="BorderThickness" Value="1" />
							<Setter Property="ScrollViewer.HorizontalScrollBarVisibility" Value="Auto" />
							<Setter Property="ScrollViewer.VerticalScrollBarVisibility" Value="Auto" />
							<Setter Property="ScrollViewer.CanContentScroll" Value="true" />
							<Setter Property="ScrollViewer.PanningMode" Value="Both" />
							<Setter Property="Stylus.IsFlicksEnabled" Value="False" />
							<Setter Property="VerticalContentAlignment" Value="Center" />
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type ListBox}">
										<Border x:Name="Bd" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" Padding="1" >
											<ScrollViewer Focusable="false" Style="{StaticResource ScrollViewerStyle}" Margin="-1">
												<ItemsPresenter SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" />
											</ScrollViewer>
										</Border>
										<ControlTemplate.Triggers>
											<Trigger Property="IsEnabled" Value="false">
												<Setter Property="Opacity" TargetName="Bd" Value="0.5" />
											</Trigger>
											<Trigger Property="IsGrouping" Value="true">
												<Setter Property="ScrollViewer.CanContentScroll" Value="false" />
											</Trigger>
										</ControlTemplate.Triggers>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Style>
					</ResourceDictionary>
				</ResourceDictionary.MergedDictionaries>
				<LinearGradientBrush x:Key="SliderThumbBackgroundBrush" EndPoint="0.56,0.99" StartPoint="0.56,0.01">
					<GradientStop Color="{StaticResource Color_029}" Offset="1" />
					<GradientStop Color="{StaticResource Color_032}" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="SliderThumbBorderBrush" Color="{StaticResource Color_027}" />
				<LinearGradientBrush x:Key="SliderThumbHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
					<GradientStop Offset="0" Color="{StaticResource Color_018}" />
					<GradientStop Offset="0.23" Color="{StaticResource Color_017}" />
					<GradientStop Offset="0.75" Color="{StaticResource Color_017}" />
					<GradientStop Offset="1" Color="{StaticResource Color_019}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="SliderThumbHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Offset="1" Color="{StaticResource Color_013}" />
					<GradientStop Color="{StaticResource Color_014}" Offset="0.05" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="SliderThumbHoverInnerBorderBrush" Color="{StaticResource Color_019}" />
				<LinearGradientBrush x:Key="SliderThumbPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
					<GradientStop Offset="1" Color="{StaticResource Color_017}" />
					<GradientStop Color="{StaticResource Color_016}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="SliderThumbPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Offset="0" Color="{StaticResource Color_012}" />
					<GradientStop Offset="1" Color="{StaticResource Color_013}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="HSliderTrackBackgroundBrush" StartPoint="0.82,1" EndPoint="0.82,0.25">
					<GradientStop Color="{StaticResource Color_026}" Offset="0.631" />
					<GradientStop Color="{StaticResource Color_032}" Offset="0.63" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="VSliderTrackBackgroundBrush" EndPoint="0.678,0.5" StartPoint="0.322,0.5">
					<GradientStop Color="{StaticResource Color_026}" Offset="0.501" />
					<GradientStop Color="{StaticResource Color_032}" Offset="0.50" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="SliderThumbFocusedBorderBrush" Color="{StaticResource Color_013}" />
				<LinearGradientBrush x:Key="SliderSelectionRangeBackgroundBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Offset="1" Color="{StaticResource Color_013}" />
					<GradientStop Color="{StaticResource Color_014}" Offset="0.05" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="GridSplitterBackgroundBrush" Color="{StaticResource Color_030}" />
				<SolidColorBrush x:Key="GridSplitterBorderBrush" Color="{StaticResource Color_027}" />
				<SolidColorBrush x:Key="GridSplitterHoverBackgroundBrush" Color="{StaticResource Color_018}" />
				<SolidColorBrush x:Key="GridSplitterHoverBorderBrush" Color="{StaticResource Color_013}" />
				<SolidColorBrush x:Key="GridSplitterPressedBackgroundBrush" Color="{StaticResource Color_017}" />
				<SolidColorBrush x:Key="GridSplitterPressedBorderBrush" Color="{StaticResource Color_013}" />
				<SolidColorBrush x:Key="GridSplitterFocusedBorderBrush" Color="{StaticResource Color_013}" />
				<SolidColorBrush x:Key="ProgressBarBackgroundBrush" Color="{StaticResource Color_005}" />
				<SolidColorBrush x:Key="ProgressBarBorderBrush" Color="{StaticResource Color_027}" />
				<LinearGradientBrush x:Key="ProgressBarForegroundBrush" EndPoint="0.5,1" StartPoint="0.5,0">
					<GradientStop Offset="0" Color="{StaticResource Color_018}" />
					<GradientStop Offset="0.23" Color="{StaticResource Color_017}" />
					<GradientStop Offset="0.75" Color="{StaticResource Color_017}" />
					<GradientStop Offset="1" Color="{StaticResource Color_019}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ProgressBarDeterminateBorderBrush" EndPoint="0.5,1" StartPoint="0.5,0">
					<GradientStop Offset="1" Color="{StaticResource Color_014}" />
					<GradientStop Color="{StaticResource Color_015}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ProgressBarIndeterminateBorderBrush" EndPoint="0.5,1" StartPoint="0.5,0">
					<GradientStop Offset="1" Color="{StaticResource Color_014}" />
					<GradientStop Color="{StaticResource Color_015}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ProgressBarIndeterminateBackgroundBrush" EndPoint="0,1" MappingMode="Absolute" SpreadMethod="Repeat" StartPoint="20,1" Opacity="0.6">
					<LinearGradientBrush.Transform>
						<TransformGroup>
							<TranslateTransform X="0" />
							<SkewTransform AngleX="-30" />
						</TransformGroup>
					</LinearGradientBrush.Transform>
					<GradientStop Color="{StaticResource Color_005}" Offset="0.249" />
					<GradientStop Color="{StaticResource Color_033}" Offset=".25" />
					<GradientStop Color="{StaticResource Color_033}" Offset="0.75" />
					<GradientStop Color="{StaticResource Color_005}" Offset="0.751" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="TooltipBackgroundBrush" EndPoint="0.5,1" StartPoint="0.5,0" Opacity="0.9">
					<GradientStop Color="{StaticResource Color_030}" Offset="1" />
					<GradientStop Color="{StaticResource Color_005}" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="TooltipBorderBrush" Color="{StaticResource Color_027}" Opacity="0.9" />
				<SolidColorBrush x:Key="TooltipShadowBackgroundBrush" Color="{StaticResource Color_001}" />
				<LinearGradientBrush x:Key="ExpanderButtonBackgroundBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Color="{StaticResource Color_030}" Offset="1" />
					<GradientStop Color="{StaticResource Color_032}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ExpanderButtonBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Color="{StaticResource Color_029}" />
					<GradientStop Color="{StaticResource Color_027}" Offset="1" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ExpanderButtonHoverBackgroundBrush" StartPoint="0,0" EndPoint="0,1">
					<GradientStop Offset="0" Color="{StaticResource Color_018}" />
					<GradientStop Offset="0.23" Color="{StaticResource Color_017}" />
					<GradientStop Offset="0.75" Color="{StaticResource Color_017}" />
					<GradientStop Offset="1" Color="{StaticResource Color_019}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ExpanderButtonHoverBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Offset="1" Color="{StaticResource Color_013}" />
					<GradientStop Color="{StaticResource Color_014}" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="ExpanderButtonHoverHiglightBorderBrush" Color="{StaticResource Color_019}" />
				<LinearGradientBrush x:Key="ExpanderButtonPressedBackgroundBrush" StartPoint="0,0 " EndPoint="0,1 ">
					<GradientStop Offset="1" Color="{StaticResource Color_017}" />
					<GradientStop Color="{StaticResource Color_016}" />
				</LinearGradientBrush>
				<LinearGradientBrush x:Key="ExpanderButtonPressedBorderBrush" StartPoint="0.5,0" EndPoint="0.5,1">
					<GradientStop Offset="0" Color="{StaticResource Color_012}" />
					<GradientStop Offset="1" Color="{StaticResource Color_013}" />
				</LinearGradientBrush>
				<SolidColorBrush x:Key="ExpanderDisabledForegroundBrush" Color="{StaticResource Color_024}" Opacity="0.5" />
				<SolidColorBrush x:Key="ExpanderDisabledBackgroundBrush" Color="{StaticResource Color_024}" />
				<SolidColorBrush x:Key="GroupBoxBorderBrush" Color="{StaticResource Color_027}" />
				<SolidColorBrush x:Key="PasswordBoxForegroundBrush" Color="{StaticResource Color_024}" />
				<Style x:Key="SliderRepeatButtonStyle" TargetType="{x:Type RepeatButton}">
					<Setter Property="OverridesDefaultStyle" Value="true" />
					<Setter Property="Focusable" Value="false" />
					<Setter Property="IsTabStop" Value="false" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type RepeatButton}">
								<Rectangle Fill="{StaticResource TransparentBrush}" />
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="HSliderThumbStyle" TargetType="{x:Type Thumb}">
					<Setter Property="Background" Value="{StaticResource SliderThumbBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource SliderThumbBorderBrush}" />
					<Setter Property="Height" Value="22" />
					<Setter Property="Width" Value="9" />
					<Setter Property="Focusable" Value="false" />
					<Setter Property="OverridesDefaultStyle" Value="true" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type Thumb}">
								<Grid SnapsToDevicePixels="True">
									<Grid x:Name="HorizontalThumbContent" Height="13" Width="9">
										<Path x:Name="ThumbBackground" Data="M0.5,0.5 L8.5,0.5 L8.5,9.9374847 L4.5208335,13.31249 L0.5,9.9374847 z" Fill="{TemplateBinding Background}" Stroke="{TemplateBinding BorderBrush}" Height="13" Width="9" Stretch="Fill" UseLayoutRounding="False" />
										<Path x:Name="ThumbInnerStroke" Data="M0.5,0.5 L8.5,0.5 L8.5,9.9374847 L4.5208335,12.972734 L0.5,9.9374847 z" Stroke="{StaticResource SliderThumbHoverInnerBorderBrush}" Height="11" Width="7" Stretch="Fill" UseLayoutRounding="False" Opacity="0" />
										<Path x:Name="ThumbFocused" Data="M0.5,0.5 L8.5,0.5 L8.5,9.9374847 L4.5208335,13.31249 L0.5,9.9374847 z" Fill="{StaticResource SliderThumbPressedBackgroundBrush}" Stroke="{StaticResource SliderThumbPressedBorderBrush}" Height="13" Width="9" Stretch="Fill" UseLayoutRounding="False" Visibility="Collapsed" />
										<Path x:Name="ThumbDisabled" Data="M0.5,0.5 L8.5,0.5 L8.5,9.9374847 L4.5208335,13.31249 L0.5,9.9374847 z" Fill="{StaticResource DisabledBackgroundBrush}" Height="13" Width="9" Stretch="Fill" UseLayoutRounding="False" Opacity="0" />
									</Grid>
								</Grid>
								<ControlTemplate.Triggers>
									<Trigger Property="IsMouseOver" Value="True">
										<Setter TargetName="ThumbInnerStroke" Property="Opacity" Value="0.6" />
										<Setter TargetName="ThumbBackground" Property="Fill" Value="{StaticResource SliderThumbHoverBackgroundBrush}" />
										<Setter TargetName="ThumbBackground" Property="Stroke" Value="{StaticResource SliderThumbHoverBorderBrush}" />
									</Trigger>
									<Trigger Property="IsMouseCaptured" Value="True">
										<Setter TargetName="ThumbBackground" Property="Fill" Value="{StaticResource SliderThumbPressedBackgroundBrush}" />
										<Setter TargetName="ThumbBackground" Property="Stroke" Value="{StaticResource SliderThumbPressedBorderBrush}" />
									</Trigger>
									<Trigger Property="IsEnabled" Value="false">
										<Setter TargetName="ThumbDisabled" Property="Opacity" Value="0.55" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="HSliderUpThumbStyle" TargetType="{x:Type Thumb}" BasedOn="{StaticResource HSliderThumbStyle}">
					<Setter Property="RenderTransform">
						<Setter.Value>
							<TransformGroup>
								<ScaleTransform ScaleY="-1" ScaleX="1" />
								<SkewTransform AngleY="0" AngleX="0" />
								<RotateTransform Angle="0" />
								<TranslateTransform />
							</TransformGroup>
						</Setter.Value>
					</Setter>
					<Setter Property="RenderTransformOrigin" Value="0.5,0.5" />
				</Style>
				<Style x:Key="HSliderDownThumbStyle" TargetType="{x:Type Thumb}" BasedOn="{StaticResource HSliderThumbStyle}" />
				<Style x:Key="VSliderThumbStyle" TargetType="{x:Type Thumb}">
					<Setter Property="Background" Value="{StaticResource SliderThumbBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource SliderThumbBorderBrush}" />
					<Setter Property="Height" Value="9" />
					<Setter Property="Width" Value="22" />
					<Setter Property="Focusable" Value="false" />
					<Setter Property="OverridesDefaultStyle" Value="true" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type Thumb}">
								<Grid SnapsToDevicePixels="True">
									<Grid Height="9" Width="13">
										<Path x:Name="VThumbBackground" Data="M0.5,0.5 L8.625,0.5 L11.5,4 L8.625,7.5 L0.5,7.5 z" Fill="{TemplateBinding Background}" Stroke="{TemplateBinding BorderBrush}" Width="13" Height="9" Stretch="Fill" UseLayoutRounding="False" />
										<Path x:Name="VThumbInnerStroke" Data="M0.5,0.5 L8.625,0.5 L11.5,4 L8.625,7.5 L0.5,7.5 z" Stroke="{StaticResource SliderThumbHoverInnerBorderBrush}" Width="11" Height="7" Stretch="Fill" UseLayoutRounding="False" Opacity="0" />
										<Path x:Name="VThumbFocused" Data="M0.5,0.5 L8.625,0.5 L11.5,4 L8.625,7.5 L0.5,7.5 z" Fill="{StaticResource SliderThumbPressedBackgroundBrush}" Stroke="{StaticResource SliderThumbPressedBorderBrush}" Width="13" Height="9" Stretch="Fill" UseLayoutRounding="False" Visibility="Collapsed" />
										<Path x:Name="VThumbDisabled" Data="M0.5,0.5 L8.625,0.5 L11.5,4 L8.625,7.5 L0.5,7.5 z" Fill="{StaticResource DisabledBackgroundBrush}" Width="13" Height="9" Stretch="Fill" UseLayoutRounding="False" Opacity="0" />
									</Grid>
								</Grid>
								<ControlTemplate.Triggers>
									<Trigger Property="IsMouseOver" Value="True">
										<Setter TargetName="VThumbInnerStroke" Property="Opacity" Value="0.6" />
										<Setter TargetName="VThumbBackground" Property="Fill" Value="{StaticResource SliderThumbHoverBackgroundBrush}" />
										<Setter TargetName="VThumbBackground" Property="Stroke" Value="{StaticResource SliderThumbHoverBorderBrush}" />
									</Trigger>
									<Trigger Property="IsMouseCaptured" Value="True">
										<Setter TargetName="VThumbBackground" Property="Fill" Value="{StaticResource SliderThumbPressedBackgroundBrush}" />
										<Setter TargetName="VThumbBackground" Property="Stroke" Value="{StaticResource SliderThumbPressedBorderBrush}" />
									</Trigger>
									<Trigger Property="IsEnabled" Value="false">
										<Setter TargetName="VThumbDisabled" Property="Opacity" Value="0.55" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="VSliderLeftThumbStyle" TargetType="{x:Type Thumb}" BasedOn="{StaticResource VSliderThumbStyle}">
					<Setter Property="RenderTransformOrigin" Value="0.5,0.5" />
					<Setter Property="RenderTransform">
						<Setter.Value>
							<TransformGroup>
								<ScaleTransform ScaleY="1" ScaleX="-1" />
								<SkewTransform AngleY="0" AngleX="0" />
								<RotateTransform Angle="0" />
								<TranslateTransform />
							</TransformGroup>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="VSliderRightThumbStyle" TargetType="{x:Type Thumb}" BasedOn="{StaticResource VSliderThumbStyle}" />
				<Style x:Key="SliderStyle" TargetType="{x:Type Slider}">
					<Setter Property="Stylus.IsPressAndHoldEnabled" Value="false" />
					<Setter Property="Background" Value="Transparent" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type Slider}">
								<Border BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" SnapsToDevicePixels="True">
									<Grid>
										<Grid.RowDefinitions>
											<RowDefinition Height="Auto" />
											<RowDefinition Height="Auto" MinHeight="{TemplateBinding MinHeight}" />
											<RowDefinition Height="Auto" />
										</Grid.RowDefinitions>
										<TickBar x:Name="TopTick" Fill="{TemplateBinding Foreground}" Height="4" Placement="Top" Grid.Row="0" Visibility="Collapsed" />
										<TickBar x:Name="BottomTick" Fill="{TemplateBinding Foreground}" Height="4" Placement="Bottom" Grid.Row="2" Visibility="Collapsed" />
										<Border x:Name="TrackBackground" Background="{StaticResource HSliderTrackBackgroundBrush}" Height="2" Grid.Row="1" VerticalAlignment="center">
											<Canvas Margin="-6,0">
												<Rectangle x:Name="PART_SelectionRange" Fill="{StaticResource SliderSelectionRangeBackgroundBrush}" Height="2" Visibility="Hidden" />
											</Canvas>
										</Border>
										<Track x:Name="PART_Track" Grid.Row="1">
											<Track.DecreaseRepeatButton>
												<RepeatButton Command="{x:Static Slider.DecreaseLarge}" Style="{StaticResource SliderRepeatButtonStyle}" />
											</Track.DecreaseRepeatButton>
											<Track.IncreaseRepeatButton>
												<RepeatButton Command="{x:Static Slider.IncreaseLarge}" Style="{StaticResource SliderRepeatButtonStyle}" />
											</Track.IncreaseRepeatButton>
											<Track.Thumb>
												<Thumb x:Name="Thumb" Style="{StaticResource HSliderThumbStyle}" />
											</Track.Thumb>
										</Track>
									</Grid>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="TickPlacement" Value="TopLeft">
										<Setter Property="Visibility" TargetName="TopTick" Value="Visible" />
										<Setter Property="Style" TargetName="Thumb" Value="{StaticResource HSliderUpThumbStyle}" />
										<Setter Property="Margin" TargetName="TrackBackground" Value="5,2,5,0" />
									</Trigger>
									<Trigger Property="TickPlacement" Value="BottomRight">
										<Setter Property="Visibility" TargetName="BottomTick" Value="Visible" />
										<Setter Property="Style" TargetName="Thumb" Value="{StaticResource HSliderDownThumbStyle}" />
										<Setter Property="Margin" TargetName="TrackBackground" Value="5,0,5,2" />
									</Trigger>
									<Trigger Property="TickPlacement" Value="Both">
										<Setter Property="Visibility" TargetName="TopTick" Value="Visible" />
										<Setter Property="Visibility" TargetName="BottomTick" Value="Visible" />
									</Trigger>
									<Trigger Property="IsSelectionRangeEnabled" Value="true">
										<Setter Property="Visibility" TargetName="PART_SelectionRange" Value="Visible" />
									</Trigger>
									<Trigger Property="IsKeyboardFocused" Value="true">
										<Setter Property="Foreground" TargetName="Thumb" Value="{StaticResource SliderThumbFocusedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
					<Style.Triggers>
						<Trigger Property="Orientation" Value="Vertical">
							<Setter Property="Template">
								<Setter.Value>
									<ControlTemplate TargetType="{x:Type Slider}">
										<Border BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" SnapsToDevicePixels="True">
											<Grid>
												<Grid.ColumnDefinitions>
													<ColumnDefinition Width="Auto" />
													<ColumnDefinition MinWidth="{TemplateBinding MinWidth}" Width="Auto" />
													<ColumnDefinition Width="Auto" />
												</Grid.ColumnDefinitions>
												<TickBar x:Name="TopTick" Grid.Column="0" Fill="{TemplateBinding Foreground}" Placement="Left" Visibility="Collapsed" Width="4" />
												<TickBar x:Name="BottomTick" Grid.Column="2" Fill="{TemplateBinding Foreground}" Placement="Right" Visibility="Collapsed" Width="4" />
												<Border x:Name="TrackBackground" Background="{StaticResource VSliderTrackBackgroundBrush}" Grid.Column="1" HorizontalAlignment="center" Width="2">
													<Canvas Margin="-1,-6">
														<Rectangle x:Name="PART_SelectionRange" Fill="{StaticResource SliderSelectionRangeBackgroundBrush}" Visibility="Hidden" Width="2" />
													</Canvas>
												</Border>
												<Track x:Name="PART_Track" Grid.Column="1">
													<Track.DecreaseRepeatButton>
														<RepeatButton Command="{x:Static Slider.DecreaseLarge}" Style="{StaticResource SliderRepeatButtonStyle}" />
													</Track.DecreaseRepeatButton>
													<Track.IncreaseRepeatButton>
														<RepeatButton Command="{x:Static Slider.IncreaseLarge}" Style="{StaticResource SliderRepeatButtonStyle}" />
													</Track.IncreaseRepeatButton>
													<Track.Thumb>
														<Thumb x:Name="Thumb" Style="{StaticResource VSliderThumbStyle}" />
													</Track.Thumb>
												</Track>
											</Grid>
										</Border>
										<ControlTemplate.Triggers>
											<Trigger Property="TickPlacement" Value="TopLeft">
												<Setter Property="Visibility" TargetName="TopTick" Value="Visible" />
												<Setter Property="Style" TargetName="Thumb" Value="{StaticResource VSliderLeftThumbStyle}" />
												<Setter Property="Margin" TargetName="TrackBackground" Value="2,5,0,5" />
											</Trigger>
											<Trigger Property="TickPlacement" Value="BottomRight">
												<Setter Property="Visibility" TargetName="BottomTick" Value="Visible" />
												<Setter Property="Style" TargetName="Thumb" Value="{StaticResource VSliderRightThumbStyle}" />
												<Setter Property="Margin" TargetName="TrackBackground" Value="0,5,2,5" />
											</Trigger>
											<Trigger Property="TickPlacement" Value="Both">
												<Setter Property="Visibility" TargetName="TopTick" Value="Visible" />
												<Setter Property="Visibility" TargetName="BottomTick" Value="Visible" />
											</Trigger>
											<Trigger Property="IsSelectionRangeEnabled" Value="true">
												<Setter Property="Visibility" TargetName="PART_SelectionRange" Value="Visible" />
											</Trigger>
											<Trigger Property="IsKeyboardFocused" Value="true">
												<Setter Property="Foreground" TargetName="Thumb" Value="{StaticResource SliderThumbFocusedBorderBrush}" />
											</Trigger>
										</ControlTemplate.Triggers>
									</ControlTemplate>
								</Setter.Value>
							</Setter>
						</Trigger>
					</Style.Triggers>
				</Style>
				<Style x:Key="RepeatButtonStyle" TargetType="{x:Type RepeatButton}">
					<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
					<Setter Property="Background" Value="{StaticResource ButtonBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource ButtonBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Padding" Value="3" />
					<Setter Property="Cursor" Value="Hand" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type RepeatButton}">
								<Grid SnapsToDevicePixels="True">
									<VisualStateManager.VisualStateGroups>
										<VisualStateGroup x:Name="CommonStates">
											<VisualState x:Name="Normal" />
											<VisualState x:Name="MouseOver">
												<Storyboard>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="Background">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBackgroundBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="BorderBrush">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBorderBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="ButtonHighlight" Storyboard.TargetProperty="Opacity">
														<SplineDoubleKeyFrame KeyTime="0" Value="1" />
													</DoubleAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Pressed">
												<Storyboard>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="Background">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBackgroundBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="BaseShape" Storyboard.TargetProperty="BorderBrush">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBorderBrush}" />
													</ObjectAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Disabled">
												<Storyboard>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="DisabledVisualElement" Storyboard.TargetProperty="Opacity">
														<SplineDoubleKeyFrame KeyTime="0" Value="0.6" />
													</DoubleAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
										</VisualStateGroup>
										<VisualStateGroup x:Name="FocusStates">
											<VisualState x:Name="Focused">
												<Storyboard>
													<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="FocusedVisualElement" />
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Unfocused" />
										</VisualStateGroup>
									</VisualStateManager.VisualStateGroups>
									<Border x:Name="BaseShape" CornerRadius="3" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" />
									<Rectangle x:Name="ButtonHighlight" Margin="1" RadiusX="2" RadiusY="2" Stroke="{StaticResource ButtonHoverHighlightBorderBrush}" StrokeThickness="1" Grid.ColumnSpan="2" Opacity="0" />
									<ContentPresenter x:Name="contentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" Content="{TemplateBinding Content}" ContentTemplate="{TemplateBinding ContentTemplate}" />
									<Rectangle x:Name="FocusedVisualElement" Stroke="{StaticResource ButtonFocusedBorderBrush}" StrokeThickness="1" RadiusX="3" RadiusY="3" Opacity="0" />
									<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" RadiusX="3" RadiusY="3" Opacity="0" />
								</Grid>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="GridSplitterStyle" TargetType="{x:Type GridSplitter}">
					<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
					<Setter Property="Background" Value="{StaticResource GridSplitterBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource GridSplitterBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="SnapsToDevicePixels" Value="True" />
					<Setter Property="PreviewStyle">
						<Setter.Value>
							<Style TargetType="Control">
								<Setter Property="Control.Template">
									<Setter.Value>
										<ControlTemplate>
											<Rectangle Fill="{StaticResource GridSplitterPressedBackgroundBrush}" RadiusX="3" RadiusY="3" Opacity="0.8" />
										</ControlTemplate>
									</Setter.Value>
								</Setter>
							</Style>
						</Setter.Value>
					</Setter>
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate>
								<Grid>
									<Border x:Name="border" BorderThickness="{TemplateBinding BorderThickness}" BorderBrush="{TemplateBinding BorderBrush}" Background="{TemplateBinding Background}" CornerRadius="3">
										<Grid>
											<StackPanel x:Name="HGrip" Height="5" VerticalAlignment="Center" HorizontalAlignment="Center" Orientation="Vertical">
												<Rectangle Fill="{StaticResource ForegroundBrush}" Height="1" Margin="1" StrokeThickness="0" Width="15" />
												<Rectangle Fill="{StaticResource ForegroundBrush}" Height="1" Margin="0" StrokeThickness="0" Width="15" />
											</StackPanel>
											<StackPanel x:Name="VGrip" Width="5" VerticalAlignment="Center" HorizontalAlignment="Center" Orientation="Horizontal" Visibility="Collapsed">
												<Rectangle Fill="{StaticResource ForegroundBrush}" Height="15" Margin="1" StrokeThickness="0" Width="1" />
												<Rectangle Fill="{StaticResource ForegroundBrush}" Height="15" Margin="0" StrokeThickness="0" Width="1" />
											</StackPanel>
										</Grid>
									</Border>
								</Grid>
								<ControlTemplate.Triggers>
									<Trigger Property="HorizontalAlignment" Value="Stretch">
										<Setter TargetName="HGrip" Property="Visibility" Value="Visible" />
										<Setter TargetName="VGrip" Property="Visibility" Value="Collapsed" />
									</Trigger>
									<Trigger Property="VerticalAlignment" Value="Stretch">
										<Setter TargetName="VGrip" Property="Visibility" Value="Visible" />
										<Setter TargetName="HGrip" Property="Visibility" Value="Collapsed" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="True">
										<Setter TargetName="border" Property="Background" Value="{StaticResource GridSplitterHoverBackgroundBrush}" />
										<Setter TargetName="border" Property="BorderBrush" Value="{StaticResource GridSplitterHoverBorderBrush}" />
									</Trigger>
									<Trigger Property="IsFocused" Value="True">
										<Setter TargetName="border" Property="BorderBrush" Value="{StaticResource GridSplitterFocusedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ProgressBarStyle" TargetType="{x:Type ProgressBar}">
					<Setter Property="Foreground" Value="{StaticResource ProgressBarForegroundBrush}" />
					<Setter Property="Background" Value="{StaticResource ProgressBarBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource ProgressBarBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ProgressBar}">
								<Grid x:Name="TemplateRoot" SnapsToDevicePixels="true">
									<VisualStateManager.VisualStateGroups>
										<VisualStateGroup x:Name="CommonStates">
											<VisualState x:Name="Determinate" />
											<VisualState x:Name="Indeterminate">
												<Storyboard RepeatBehavior="Forever">
													<DoubleAnimation Duration="00:00:.5" From="0" To="20" Storyboard.TargetProperty="(Shape.Fill).(LinearGradientBrush.Transform).(TransformGroup.Children)[0].X" Storyboard.TargetName="IndeterminateGradientFill" />
												</Storyboard>
											</VisualState>
										</VisualStateGroup>
									</VisualStateManager.VisualStateGroups>
									<Border x:Name="ProgressBarTrack" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" CornerRadius="3" />
									<Rectangle x:Name="PART_Track" Margin="1" RadiusY="2" RadiusX="2" />
									<Decorator x:Name="PART_Indicator" HorizontalAlignment="Left">
										<Grid x:Name="Foreground">
											<Rectangle x:Name="Indicator" Fill="{TemplateBinding Foreground}" RadiusY="2" RadiusX="2" Margin="2" Stroke="{StaticResource ProgressBarDeterminateBorderBrush}" StrokeThickness="{TemplateBinding BorderThickness}" />
										</Grid>
									</Decorator>
									<Grid x:Name="IndeterminateRoot" Visibility="Collapsed" Margin="1">
										<Rectangle x:Name="IndeterminateSolidFill" Fill="{TemplateBinding Foreground}" Stroke="{StaticResource ProgressBarIndeterminateBorderBrush}" Margin="{TemplateBinding BorderThickness}" Opacity="1" RadiusY="2" RadiusX="2" RenderTransformOrigin="0.5,0.5" />
										<Rectangle x:Name="IndeterminateGradientFill" Fill="{StaticResource ProgressBarIndeterminateBackgroundBrush}" Margin="{TemplateBinding BorderThickness}" RadiusY="2" RadiusX="2" StrokeThickness="1" />
									</Grid>
								</Grid>
								<ControlTemplate.Triggers>
									<Trigger Property="Orientation" Value="Vertical">
										<Setter Property="LayoutTransform" TargetName="TemplateRoot">
											<Setter.Value>
												<RotateTransform Angle="-90" />
											</Setter.Value>
										</Setter>
									</Trigger>
									<Trigger Property="IsIndeterminate" Value="true">
										<Setter Property="Visibility" TargetName="Indicator" Value="Collapsed" />
										<Setter Property="Visibility" TargetName="IndeterminateRoot" Value="Visible" />
									</Trigger>
									<Trigger Property="IsIndeterminate" Value="false"/>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="PasswordBoxStyle" TargetType="{x:Type PasswordBox}">
					<Setter Property="Foreground" Value="{StaticResource PasswordBoxForegroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource TextBoxBorderBrush}" />
					<Setter Property="Background" Value="{StaticResource TextBoxBackgroundBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Padding" Value="4,2" />
					<Setter Property="MinHeight" Value="24" />
					<Setter Property="PasswordChar" Value="*" />
					<Setter Property="KeyboardNavigation.TabNavigation" Value="None" />
					<Setter Property="SelectionBrush" Value="{StaticResource TextBoxSelectionBackgroundBrush}" />
					<Setter Property="AllowDrop" Value="true" />
					<Setter Property="FocusVisualStyle" Value="{x:Null}" />
					<Setter Property="ScrollViewer.PanningMode" Value="VerticalFirst" />
					<Setter Property="Stylus.IsFlicksEnabled" Value="False" />
					<Setter Property="FlowDirection" Value="LeftToRight" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type PasswordBox}">
								<Border Background="{TemplateBinding Background}" x:Name="Bd" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}">
									<ScrollViewer x:Name="PART_ContentHost" />
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsEnabled" Value="False">
										<Setter Property="BorderBrush" Value="{StaticResource TextBoxDisabledBorderBrush}" TargetName="Bd" />
										<Setter Property="Foreground" Value="{StaticResource ForegroundDisabledBrush}" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="True">
										<Setter Property="BorderBrush" Value="{StaticResource TextBoxHoverBorderBrush}" TargetName="Bd" />
									</Trigger>
									<Trigger Property="IsFocused" Value="True">
										<Setter Property="BorderBrush" Value="{StaticResource TextBoxFocusedBrush}" TargetName="Bd" />
									</Trigger>
									<MultiDataTrigger>
										<MultiDataTrigger.Conditions>
											<Condition Binding="{Binding IsReadOnly, RelativeSource={RelativeSource Self}}" Value="True" />
											<Condition Binding="{Binding IsEnabled, RelativeSource={RelativeSource Self}}" Value="True" />
										</MultiDataTrigger.Conditions>
										<Setter Property="Background" Value="{StaticResource TextBoxReadOnlyBackgroundBrush}" />
										<Setter Property="BorderBrush" Value="{StaticResource TextBoxReadOnlyBorderBrush}" />
									</MultiDataTrigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="{x:Type ToolTip}" TargetType="ToolTip">
					<Setter Property="OverridesDefaultStyle" Value="true" />
					<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
					<Setter Property="Background" Value="{StaticResource TooltipBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource TooltipBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Padding" Value="5" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="ToolTip">
								<Grid>
									<Grid>
										<Rectangle Fill="{StaticResource TooltipShadowBackgroundBrush}" Margin="0,0,-1,-1" Opacity="0.1" RadiusY="1" RadiusX="1" />
										<Rectangle Fill="{StaticResource TooltipShadowBackgroundBrush}" Margin="0,0,-2,-2" Opacity="0.08" RadiusY="2" RadiusX="2" />
										<Rectangle Fill="{StaticResource TooltipShadowBackgroundBrush}" Margin="0,0,-3,-3" Opacity="0.06" RadiusY="3" RadiusX="3" />
										<Rectangle Fill="{StaticResource TooltipShadowBackgroundBrush}" Margin="0,0,-4,-4" Opacity="0.04" RadiusY="4" RadiusX="4" />
									</Grid>
									<Rectangle Fill="{TemplateBinding Background}" Stroke="{TemplateBinding BorderBrush}" Margin="0" StrokeThickness="{TemplateBinding BorderThickness}" />
									<StackPanel Orientation="Horizontal">
										<ContentPresenter Margin="{TemplateBinding Padding}" Content="{TemplateBinding Content}" />
									</StackPanel>
								</Grid>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ExpanderRightHeaderStyle" TargetType="{x:Type ToggleButton}">
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ToggleButton}">
								<Border Padding="{TemplateBinding Padding}">
									<Grid Background="{StaticResource TransparentBrush}" SnapsToDevicePixels="False">
										<Grid.RowDefinitions>
											<RowDefinition Height="19" />
											<RowDefinition Height="*" />
										</Grid.RowDefinitions>
										<Grid>
											<Grid.LayoutTransform>
												<TransformGroup>
													<TransformGroup.Children>
														<TransformCollection>
															<RotateTransform Angle="-90" />
														</TransformCollection>
													</TransformGroup.Children>
												</TransformGroup>
											</Grid.LayoutTransform>
											<Rectangle x:Name="rectangle" Fill="{StaticResource ExpanderButtonBackgroundBrush}" HorizontalAlignment="Center" Height="19" Stroke="{StaticResource ExpanderButtonBorderBrush}" VerticalAlignment="Center" Width="19" />
											<Rectangle x:Name="rectanglehighlight" Stroke="{StaticResource ExpanderButtonHoverHiglightBorderBrush}" StrokeThickness="1" Margin="1" Opacity="0" Height="17" Width="17" />
											<Path x:Name="arrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" HorizontalAlignment="Center" VerticalAlignment="Center" />
										</Grid>
										<ContentPresenter HorizontalAlignment="Center" Margin="0,4,0,0" Grid.Row="1" RecognizesAccessKey="True" SnapsToDevicePixels="True" VerticalAlignment="Stretch" />
									</Grid>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsChecked" Value="true">
										<Setter Property="Data" TargetName="arrow" Value="M3.4,-4.4 L6.8,3.9 3.9566912E-07,3.9 z" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBorderBrush}" />
										<Setter Property="Opacity" TargetName="rectanglehighlight" Value="1" />
									</Trigger>
									<Trigger Property="IsPressed" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ExpanderUpHeaderStyle" TargetType="{x:Type ToggleButton}">
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ToggleButton}">
								<Border Padding="{TemplateBinding Padding}">
									<Grid Background="{StaticResource TransparentBrush}" SnapsToDevicePixels="False">
										<Grid.ColumnDefinitions>
											<ColumnDefinition Width="19" />
											<ColumnDefinition Width="*" />
										</Grid.ColumnDefinitions>
										<Grid>
											<Grid.LayoutTransform>
												<TransformGroup>
													<TransformGroup.Children>
														<TransformCollection>
															<RotateTransform Angle="180" />
														</TransformCollection>
													</TransformGroup.Children>
												</TransformGroup>
											</Grid.LayoutTransform>
											<Rectangle x:Name="rectangle" Fill="{StaticResource ExpanderButtonBackgroundBrush}" HorizontalAlignment="Center" Height="19" Stroke="{StaticResource ExpanderButtonBorderBrush}" VerticalAlignment="Center" Width="19" />
											<Rectangle x:Name="rectanglehighlight" Stroke="{StaticResource ExpanderButtonHoverHiglightBorderBrush}" StrokeThickness="1" Margin="1" Opacity="0" Height="17" Width="17" />
											<Path x:Name="arrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" HorizontalAlignment="Center" VerticalAlignment="Center" />
										</Grid>
										<ContentPresenter Grid.Column="1" HorizontalAlignment="Stretch" Margin="4,0,0,0" RecognizesAccessKey="True" SnapsToDevicePixels="True" VerticalAlignment="Center" />
									</Grid>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsChecked" Value="true">
										<Setter Property="Data" TargetName="arrow" Value="M3.4,-4.4 L6.8,3.9 3.9566912E-07,3.9 z" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBorderBrush}" />
										<Setter Property="Opacity" TargetName="rectanglehighlight" Value="1" />
									</Trigger>
									<Trigger Property="IsPressed" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ExpanderLeftHeaderStyle" TargetType="{x:Type ToggleButton}">
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ToggleButton}">
								<Border Padding="{TemplateBinding Padding}">
									<Grid Background="{StaticResource TransparentBrush}" SnapsToDevicePixels="False">
										<Grid.RowDefinitions>
											<RowDefinition Height="19" />
											<RowDefinition Height="*" />
										</Grid.RowDefinitions>
										<Grid>
											<Grid.LayoutTransform>
												<TransformGroup>
													<TransformGroup.Children>
														<TransformCollection>
															<RotateTransform Angle="90" />
														</TransformCollection>
													</TransformGroup.Children>
												</TransformGroup>
											</Grid.LayoutTransform>
											<Rectangle x:Name="rectangle" Fill="{StaticResource ExpanderButtonBackgroundBrush}" HorizontalAlignment="Center" Height="19" Stroke="{StaticResource ExpanderButtonBorderBrush}" VerticalAlignment="Center" Width="19" />
											<Rectangle x:Name="rectanglehighlight" Stroke="{StaticResource ExpanderButtonHoverHiglightBorderBrush}" StrokeThickness="1" Margin="1" Opacity="0" Height="17" Width="17" />
											<Path x:Name="arrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" HorizontalAlignment="Center" VerticalAlignment="Center" />
										</Grid>
										<ContentPresenter Grid.Row="1" HorizontalAlignment="Center" Margin="0,4,0,0" RecognizesAccessKey="True" SnapsToDevicePixels="True" VerticalAlignment="Stretch" />
									</Grid>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsChecked" Value="true">
										<Setter Property="Data" TargetName="arrow" Value="M3.4,-4.4 L6.8,3.9 3.9566912E-07,3.9 z" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBorderBrush}" />
										<Setter Property="Opacity" TargetName="rectanglehighlight" Value="1" />
									</Trigger>
									<Trigger Property="IsPressed" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ExpanderDownHeaderStyle" TargetType="{x:Type ToggleButton}">
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ToggleButton}">
								<Border Padding="{TemplateBinding Padding}">
									<Grid Background="{StaticResource TransparentBrush}" SnapsToDevicePixels="False">
										<Grid.ColumnDefinitions>
											<ColumnDefinition Width="19" />
											<ColumnDefinition Width="*" />
										</Grid.ColumnDefinitions>
										<Rectangle x:Name="rectangle" Fill="{StaticResource ExpanderButtonBackgroundBrush}" HorizontalAlignment="Center" Height="19" Stroke="{StaticResource ExpanderButtonBorderBrush}" VerticalAlignment="Center" Width="19" />
										<Rectangle x:Name="rectanglehighlight" Stroke="{StaticResource ExpanderButtonHoverHiglightBorderBrush}" StrokeThickness="1" Margin="1" Opacity="0" Height="17" Width="17" />
										<Path x:Name="arrow" Data="M0,0 L8,0 L4,4 z" Width="6" Height="4" Fill="{StaticResource GlyphBorderBrush}" Stretch="Fill" HorizontalAlignment="Center" VerticalAlignment="Center" />
										<ContentPresenter Grid.Column="1" HorizontalAlignment="Stretch" Margin="4,0,0,0" RecognizesAccessKey="True" SnapsToDevicePixels="True" VerticalAlignment="Center" />
									</Grid>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsChecked" Value="true">
										<Setter Property="Data" TargetName="arrow" Value="M3.4,-4.4 L6.8,3.9 3.9566912E-07,3.9 z" />
									</Trigger>
									<Trigger Property="IsMouseOver" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonHoverBorderBrush}" />
										<Setter Property="Opacity" TargetName="rectanglehighlight" Value="1" />
									</Trigger>
									<Trigger Property="IsPressed" Value="true">
										<Setter Property="Fill" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBackgroundBrush}" />
										<Setter Property="Stroke" TargetName="rectangle" Value="{StaticResource ExpanderButtonPressedBorderBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ExpanderStyle" TargetType="{x:Type Expander}">
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="HorizontalContentAlignment" Value="Stretch" />
					<Setter Property="VerticalContentAlignment" Value="Stretch" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type Expander}">
								<Border BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" CornerRadius="3" SnapsToDevicePixels="true">
									<DockPanel>
										<ToggleButton x:Name="HeaderSite" ContentTemplate="{TemplateBinding HeaderTemplate}" ContentTemplateSelector="{TemplateBinding HeaderTemplateSelector}" Content="{TemplateBinding Header}" DockPanel.Dock="Top" Foreground="{TemplateBinding Foreground}" FontWeight="{TemplateBinding FontWeight}" FontStyle="{TemplateBinding FontStyle}" FontStretch="{TemplateBinding FontStretch}" FontSize="{TemplateBinding FontSize}" FontFamily="{TemplateBinding FontFamily}" HorizontalContentAlignment="{TemplateBinding HorizontalContentAlignment}" IsChecked="{Binding IsExpanded, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}" Margin="1" MinWidth="0" MinHeight="0" Padding="{TemplateBinding Padding}" Style="{StaticResource ExpanderDownHeaderStyle}" VerticalContentAlignment="{TemplateBinding VerticalContentAlignment}" />
										<ContentPresenter x:Name="ExpandSite" DockPanel.Dock="Bottom" Focusable="false" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" Visibility="Collapsed" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" />
									</DockPanel>
								</Border>
								<ControlTemplate.Triggers>
									<Trigger Property="IsExpanded" Value="true">
										<Setter Property="Visibility" TargetName="ExpandSite" Value="Visible" />
									</Trigger>
									<Trigger Property="ExpandDirection" Value="Right">
										<Setter Property="DockPanel.Dock" TargetName="ExpandSite" Value="Right" />
										<Setter Property="DockPanel.Dock" TargetName="HeaderSite" Value="Left" />
										<Setter Property="Style" TargetName="HeaderSite" Value="{StaticResource ExpanderRightHeaderStyle}" />
									</Trigger>
									<Trigger Property="ExpandDirection" Value="Up">
										<Setter Property="DockPanel.Dock" TargetName="ExpandSite" Value="Top" />
										<Setter Property="DockPanel.Dock" TargetName="HeaderSite" Value="Bottom" />
										<Setter Property="Style" TargetName="HeaderSite" Value="{StaticResource ExpanderUpHeaderStyle}" />
									</Trigger>
									<Trigger Property="ExpandDirection" Value="Left">
										<Setter Property="DockPanel.Dock" TargetName="ExpandSite" Value="Left" />
										<Setter Property="DockPanel.Dock" TargetName="HeaderSite" Value="Right" />
										<Setter Property="Style" TargetName="HeaderSite" Value="{StaticResource ExpanderLeftHeaderStyle}" />
									</Trigger>
									<Trigger Property="IsEnabled" Value="false">
										<Setter Property="Foreground" Value="{StaticResource ExpanderDisabledForegroundBrush}" />
									</Trigger>
								</ControlTemplate.Triggers>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style x:Key="ToggleButtonStyle" TargetType="{x:Type ToggleButton}">
					<Setter Property="Foreground" Value="{StaticResource ForegroundBrush}" />
					<Setter Property="Background" Value="{StaticResource ButtonBackgroundBrush}" />
					<Setter Property="BorderBrush" Value="{StaticResource ButtonBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Padding" Value="2" />
					<Setter Property="Cursor" Value="Hand" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type ToggleButton}">
								<Grid>
									<VisualStateManager.VisualStateGroups>
										<VisualStateGroup x:Name="CommonStates">
											<VisualState x:Name="Normal" />
											<VisualState x:Name="MouseOver">
												<Storyboard>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="Background">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBackgroundBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="BorderBrush">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonHoverBorderBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="ButtonHighlight" Storyboard.TargetProperty="Opacity">
														<SplineDoubleKeyFrame KeyTime="0" Value="1" />
													</DoubleAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Pressed">
												<Storyboard>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="Background">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBackgroundBrush}" />
													</ObjectAnimationUsingKeyFrames>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetName="Background" Storyboard.TargetProperty="BorderBrush">
														<DiscreteObjectKeyFrame KeyTime="0" Value="{StaticResource ButtonPressedBorderBrush}" />
													</ObjectAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Disabled">
												<Storyboard>
													<DoubleAnimationUsingKeyFrames Storyboard.TargetName="DisabledVisualElement" Storyboard.TargetProperty="Opacity">
														<SplineDoubleKeyFrame KeyTime="0" Value="0.6" />
													</DoubleAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
										</VisualStateGroup>
										<VisualStateGroup x:Name="CheckStates">
											<VisualState x:Name="Checked">
												<Storyboard>
													<ObjectAnimationUsingKeyFrames Storyboard.TargetProperty="(UIElement.Visibility)" Storyboard.TargetName="checkedBd">
														<DiscreteObjectKeyFrame KeyTime="0">
															<DiscreteObjectKeyFrame.Value>
																<Visibility>Visible</Visibility>
															</DiscreteObjectKeyFrame.Value>
														</DiscreteObjectKeyFrame>
													</ObjectAnimationUsingKeyFrames>
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Unchecked" />
											<VisualState x:Name="Indeterminate" />
										</VisualStateGroup>
										<VisualStateGroup x:Name="FocusStates">
											<VisualState x:Name="Focused">
												<Storyboard>
													<DoubleAnimation Duration="0" To="1" Storyboard.TargetProperty="(UIElement.Opacity)" Storyboard.TargetName="FocusedVisualElement" />
												</Storyboard>
											</VisualState>
											<VisualState x:Name="Unfocused" />
										</VisualStateGroup>
									</VisualStateManager.VisualStateGroups>
									<Rectangle x:Name="Bd" Fill="{StaticResource TransparentBrush}" />
									<Grid>
										<Border x:Name="Background" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" />
										<Rectangle x:Name="ButtonHighlight" Margin="1" Stroke="{StaticResource ButtonHoverHighlightBorderBrush}" StrokeThickness="1" Grid.ColumnSpan="2" Opacity="0" />
										<Border x:Name="checkedBd" BorderBrush="{StaticResource ButtonPressedBorderBrush}" BorderThickness="1" Background="{StaticResource ButtonPressedBackgroundBrush}" Visibility="Collapsed" />
										<ContentPresenter x:Name="contentPresenter" HorizontalAlignment="{TemplateBinding HorizontalContentAlignment}" Margin="{TemplateBinding Padding}" VerticalAlignment="{TemplateBinding VerticalContentAlignment}" Content="{TemplateBinding Content}" ContentTemplate="{TemplateBinding ContentTemplate}" />
										<Rectangle x:Name="FocusedVisualElement" Stroke="{StaticResource ButtonFocusedBorderBrush}" StrokeThickness="1" Opacity="0" />
										<Rectangle x:Name="DisabledVisualElement" Fill="{StaticResource DisabledBackgroundBrush}" IsHitTestVisible="false" Opacity="0" />
									</Grid>
								</Grid>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<BorderGapMaskConverter x:Key="BorderGapMaskConverter" />
				<Style x:Key="GroupBoxStyle" TargetType="{x:Type GroupBox}">
					<Setter Property="BorderBrush" Value="{StaticResource GroupBoxBorderBrush}" />
					<Setter Property="BorderThickness" Value="1" />
					<Setter Property="Template">
						<Setter.Value>
							<ControlTemplate TargetType="{x:Type GroupBox}">
								<Grid SnapsToDevicePixels="true">
									<Grid.ColumnDefinitions>
										<ColumnDefinition Width="6" />
										<ColumnDefinition Width="Auto" />
										<ColumnDefinition Width="*" />
										<ColumnDefinition Width="6" />
									</Grid.ColumnDefinitions>
									<Grid.RowDefinitions>
										<RowDefinition Height="Auto" />
										<RowDefinition Height="Auto" />
										<RowDefinition Height="*" />
										<RowDefinition Height="6" />
									</Grid.RowDefinitions>
									<Border BorderBrush="{StaticResource TransparentBrush}" BorderThickness="{TemplateBinding BorderThickness}" Background="{TemplateBinding Background}" Grid.ColumnSpan="4" Grid.Column="0" CornerRadius="4" Grid.Row="1" Grid.RowSpan="3" />
									<Border x:Name="Header" Grid.Column="1" Padding="3,1,3,0" Grid.Row="0" Grid.RowSpan="2">
										<ContentPresenter ContentSource="Header" RecognizesAccessKey="True" SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" />
									</Border>
									<ContentPresenter Grid.ColumnSpan="2" Grid.Column="1" Margin="{TemplateBinding Padding}" Grid.Row="2" SnapsToDevicePixels="{TemplateBinding SnapsToDevicePixels}" />
									<Border Grid.ColumnSpan="4" CornerRadius="4" Grid.Row="1" Grid.RowSpan="3">
										<Border.OpacityMask>
											<MultiBinding ConverterParameter="7" Converter="{StaticResource BorderGapMaskConverter}">
												<Binding ElementName="Header" Path="ActualWidth" />
												<Binding Path="ActualWidth" RelativeSource="{RelativeSource Self}" />
												<Binding Path="ActualHeight" RelativeSource="{RelativeSource Self}" />
											</MultiBinding>
										</Border.OpacityMask>
										<Border BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="3"/>
									</Border>
								</Grid>
							</ControlTemplate>
						</Setter.Value>
					</Setter>
				</Style>
				<Style BasedOn="{StaticResource ButtonStyle}" TargetType="{x:Type Button}" />
				<Style BasedOn="{StaticResource ScrollBarStyle}" TargetType="{x:Type ScrollBar}" />
				<Style BasedOn="{StaticResource ScrollViewerStyle}" TargetType="{x:Type ScrollViewer}" />
				<Style BasedOn="{StaticResource ComboBoxStyle}" TargetType="{x:Type ComboBox}" />
				<Style BasedOn="{StaticResource ComboBoxItemStyle}" TargetType="{x:Type ComboBoxItem}" />
				<Style BasedOn="{StaticResource TextBoxStyle}" TargetType="{x:Type TextBox}" />
				<Style BasedOn="{StaticResource ListBoxStyle}" TargetType="{x:Type ListBox}" />
				<Style BasedOn="{StaticResource ListBoxItemStyle}" TargetType="{x:Type ListBoxItem}" />
				<Style BasedOn="{StaticResource CheckBoxStyle}" TargetType="{x:Type CheckBox}" />
				<Style BasedOn="{StaticResource RadioButtonStyle}" TargetType="{x:Type RadioButton}" />
				<Style BasedOn="{StaticResource SliderStyle}" TargetType="{x:Type Slider}" />
				<Style BasedOn="{StaticResource RepeatButtonStyle}" TargetType="{x:Type RepeatButton}" />
				<Style BasedOn="{StaticResource GridSplitterStyle}" TargetType="{x:Type GridSplitter}" />
				<Style BasedOn="{StaticResource ProgressBarStyle}" TargetType="{x:Type ProgressBar}" />
				<Style BasedOn="{StaticResource PasswordBoxStyle}" TargetType="{x:Type PasswordBox}" />
				<Style BasedOn="{StaticResource ExpanderStyle}" TargetType="{x:Type Expander}" />
				<Style BasedOn="{StaticResource ToggleButtonStyle}" TargetType="{x:Type ToggleButton}" />
				<Style BasedOn="{StaticResource GroupBoxStyle}" TargetType="{x:Type GroupBox}" />
			</ResourceDictionary>
		</ResourceDictionary.MergedDictionaries>
	</ResourceDictionary>
</Window.Resources>

<Grid HorizontalAlignment="Left" VerticalAlignment="Top" Width="699" Height="315" Margin="0,0,0,0">
<Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Profiles:" Margin="10,7,0,0" Name="lblProfiles"/>
<ListBox HorizontalAlignment="Left" BorderThickness="1" Height="200" VerticalAlignment="Top" Width="675" Margin="13,35,0,0" Background="#ffffff" Name="listProfiles"/>
<Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Selected:" Margin="10,245,0,0" Name="lblSelected"/>
<Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="(no profile selected)" Margin="80,245,0,0" Name="lblSelectedProfile" FontWeight="Bold"/>
<Button Content="Start" HorizontalAlignment="Left" VerticalAlignment="Top" Width="100" Margin="369.9,247,0,0" Name="btnStart"/>
<Button Content="Cache" HorizontalAlignment="Left" VerticalAlignment="Top" Width="100" Margin="479,247,0,0" Name="btnCache"/>
<Button Content="Location" HorizontalAlignment="Left" VerticalAlignment="Top" Width="100" Margin="588,247,0,0" Name="btnLocation"/>
<CheckBox HorizontalAlignment="Left" VerticalAlignment="Top" Content="DEV" Margin="230,250,0,0" Name="chkDev"/>
<CheckBox HorizontalAlignment="Left" VerticalAlignment="Top" Content="ADAL" Margin="290,250,0,0" Name="chkAdal"/>
<Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="New profile:" Margin="10,285,0,0" Name="lblNewProfile"/>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="120" TextWrapping="Wrap" Margin="91,283,0,0" Name="txtNewProfile" VerticalScrollBarVisibility="Disabled" FlowDirection="LeftToRight"/>
<Button Content="Create" HorizontalAlignment="Left" VerticalAlignment="Top" Width="100" Margin="588,285,0,0" Name="btnCreate"/>
<TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="23" Width="120" TextWrapping="Wrap" Margin="328.5,282.5875244140625,0,0" Name="txtSelectedProfile" Visibility="Hidden"/>
</Grid>
</Window>
"@


# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
#----Script Execution
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #

$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
#----Icon Setup
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #

#region Icon
$tmsIconBase64 = 'AAABAAEAICAAAAEAIACoEAAAFgAAACgAAAAgAAAAQAAAAAEAIAAAAAAAABAAABILAAASCwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwUEADwaFwAAAAAAFAkIAUAbGAFVJCABWCYhAVgmIQFYJSEBWCUhAVclIQFXJSEBVyUhAVclIQFXJSEBWCUhAVgmIQFYJiEBVSQgAUAbGAEUCQgBAAAAADwaFwALBQQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwEBAP/NtQD///8AaiciAehvYgP/y7kB/6+aAP+ijgD///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP///wD/oo4A/6+aAP/LuQHob2IDaiciAf///wD/zbUAAwEBAAAAAAAAAAAAAAAAAAQCAQD/3cUA/9rCAMVgVgHvjoABiU5GAAsGBgEAAAALAQAAEgUCAhQGAwMUBwMCFAcCAhQHAwIUBwMDFAcDAxQHAwIUBwICFAYCAhQHAwMUBgICFAEAABIAAAALCwYGAYlORgDvjoABxWBWAf/awgD/3cUABAIBAAAAAAAAAAAA/4p7AP+PgACLRD0BBQAAADMWExGQPjZzp0c/vKxKQdeuSkLhrktC465KQuOtSkHjrUlB46xJQeOrSUDjq0lA46tJQeOsSUHjrUpB465KQeOuSkLjrkpC4axJQdenRz+8kD02czMWExEFAAAAi0Q9Af+PgAD/insAAAAAAAICAgD/kIEAjjw2AncwKgBvMCooq0lB1LlPRv+6UEf+ulBH/7pQR/+5T0b/uE9G/7dORf+1TUT/skxD/7BLQ/+vS0L/sUtD/7NMRP+1TkX/t05F/7lPRv+6UEb/ulBH/7pQR/65T0b/q0lB1G8wKih3MCoAjjw2Av+RgQACAgIAYysnAHs1LwElEA4AHQ0LC65LQ867UUj/uFBH+rhPR/y4UEf9uE9G/bdPRv21TkX9sUxE/atKQf2mRz/9okY+/aFGPv2jRj79p0hA/a1KQv2yTET9tU5F/bdPRv23T0b9t09G/LhPRvq7UUj/rktDzh0NCwslEA4AezUvAWMrJwAIAwMAy1hOA8pYTgChRj5pulBI/7hQR/q4UEf/uFBH/7hPR/+3T0b/tU5G/7FNRP+qSUH/oUc//5pEPf+RPTb/jzs0/5Q/OP+cRT7/o0c//6pJQf+wTEP/s01F/7VORv+2T0b/uE9G/7lQR/q6UUj/oUY+acpYTgDLWE4DCAMDAC0UEgD/g3UC/4R1ALBNRLG6UUj/t1BH/LZPRv+0Tkb/s05F/7JNRf+vTET/qElB/6BHP/+RPDT/hDIr/4tCPP+QSkT/iDs1/4QxKv+VQDn/nkU+/6RHP/+qSkL/rkxD/7NORf+2T0f/uFBH/LtRSf+wTUSx/4R2AP+EdQItFBIAYSomAQAAAAAAAAABtE9Gz7pRSP+2T0f9sU1F/6xLQ/+pSkL/pklB/6NHP/+dRj//jzoy/5VOSP/KpqP/69bV//Pi4P/r1NP/wJGO/4g6NP+OPTb/mEU+/55HP/+lSUH/rEtD/7RPRv+4UEj9u1JJ/7RPRs8AAAABAAAAAGEqJgF1NC4BHA0MAAAAAAe1UEfbuVFJ/7NORv2rS0T/o0lC/51GP/+ZRT7/lkU+/489Nv+VUEv/1MLB/+jf3//r3t3/9OXl//zw7///////27u5/4E0Lv9/MSr/hjQt/5U/OP+mSkL/sE1F/7dQSP27Ukr/tlBI2wAAAAcZCwoAdTQuAXk2MAE3GRcADwcHCbZQSN65Ukn/sU5G/aJFPv+PODD/hTQt/4AxK/9+MSr/eiwm/6GKiP+2sbH/uq+u/9HFxP/o2dj/9eXk//vq6f///v7/xJuY/7x/ev/JjYj/nVBK/5pAOf+uTkb/tlBI/bxTSv+3UUjeDAUFCTQXFQB5NjABejYxATgZFwAQBwcJt1FJ3rlTSv+tSkL9q1dQ/8+VkP/MlI//ypOO/8iQjP/KlZH/1rm3/9e6t//fwb//28bE/9zQz//z5OP//O3s///x8P/46ej/9cvH///e2v/2x8P/qVdR/6hIQP+2Ukn9vFRL/7dSSd4NBgUJNBcVAHo2MQF6NzEBORoXABEIBwm3Ukneu1VM/6hDO/3CgHr///Xz//7p5///6+j//+/t///x7///5OH//uTi///l4v/z29n/1srJ//Hi4f/87ez///Lx//jn5f/qv7v//MvH///c2f/UlpH/o0I6/7dTS/29VEz/uFJK3g0GBQk1GBUAejcxAXs3MgE5GhgAEQgHCbhSSt67Vk3/qUQ8/cKAev//7uz/++Hf///r6f/vxMH/46mk///t6//85eP//+jm//Ld2//Ux8f/8OHg//zt7P//8vH/+ejn/+vBvf/+zsr//9jU/9+jn/+mRT3/uFRL/b1VTP+5U0veDQYFCTUYFgB7NzIBezgyATkbGAARCAcJuVNL3rxWTv+pRDz9w4F8///08v/95uT///X0/+eyrv/SgXv///b1//3n5f//7Or/8t/e/9THxv/w4eD//O3s///y8f/56Of/68G9//7Oyv//2dX/4aKe/6lGP/+6VUz9vlZN/7lUS94OBgYJNRgWAHs4MgF8ODIBOhsYABEJBwm5VEzevVdP/6pFPf3Dg37///f2//3q6P//9vX/6Lez/9WKhP//9/b//evp///w7v/y4uH/08bF/+/g3//77Ov///Hw//jn5v/rwLz//s3J///Y1P/jo5//r0lB/7xWTv2/Vk7/ulRM3g4GBgk2GBYAfDgyAXw4MwE6GxgAEQgHCbpUTN6+WFD/rEY+/cWFgP//+/r//ezr///////pxMH/1ZCL///////+8O7///Py//Pm5P/Wy8r/8uXk//3w7///9vX/+ezr/+7Ewf//0c3//9vX/+WopP+zTEP/vldP/cBXT/+7VU3eDgYGCTYYFgB8ODMBfDkzATkbGAARCAcJu1VN3r9ZUf+wSD/9yYiD///9/f//9PP/7srH/9SJg//JbWb/6Lq2//vq6f//+fj/8ubl/9K/vv/r19b/9N/e//jj4v/y2df/6bm1//fEv//8zMj/3JSP/7dORv/AWFD9wVhQ/7tWTd4OBgYJNhkWAHw5MwF9OTQBOBsYABAICAm7Vk7ewFpS/7VKQv3Oi4b///7+//739v/nu7f/36ai/+Guqv/fqKT/+erp///////o09H/jkM9/5RDPf+jUEn/qFRN/6BKQ/+hTEb/oUtE/6xSS/+2U0v/vFZO/8BYUP3CWVH/vFZO3g8HBgk2GRYAfTk0AX06NAE3GhgAEAgICbxXT97CW1P/uUxE/dKQiv///////v39/////////////////////////v7///////bv7v/dxMP/zKCd/59KQ/+fQjv/v3Nt//G8uP/hpaD/sVVO/7ZTSv++WFD/wVlR/cNaUv+8V0/eDwcGCTYZFwB9OjQBfjo1ATYZFwAOBwYJvVhQ3sNbUv+/VU39xmtj/+S4tf/lurf/5Li0/+O3tP/jt7T/4bay/+C6t//27ez/+O/u//nr6v//////1KKe/6lJQv/3ycX//9bS///e2//alI//tk1F/8FbU//CWlH9xFtS/71YUN4OBwYJNhkXAH46NQF+OzUBNhkXAA4GBgm+WFDexFtT/8NbU/3BV0//vk5F/75PRv++T0b/vk9G/71PR/+3SD//u11W//Xj4v/56ef/+uno///z8v/t0M7/tFBJ//S+uv//2tb//9zY/9qMhv+7UUn/wlxT/8NbUv3EW1P/vlhQ3g4HBgk2GRcAfjs1AX06NQEbDQwAAAAAB75ZUdvFXFT/xFtT/cRcVP/FXlb/xV5W/8VeVv/FXlb/xF5W/8JcVP/BXlf/9d/d///7+//+7u3//////+S0sf+4S0L/y29o/+uppP/fk47/wVpS/8JaUv/DW1P/xFtT/cVcVP++WVHbAAAABxsNDAB9OjUBbzQvAQAAAAD///8AvllRzsVdVP/EXFT9xFxU/8RcVP/EXFT/xFxU/8RcVP/EXFT/xF1V/79UTP/Oe3X/9dnX//3q6f/sw8H/xGJb/8JZUf/CWFD/v1NL/8BUTP/EW1P/xFxU/8RcVP/EXFT9xV1U/75ZUc7///8AAAAAAG80LwFFIB4A/3pwAv95bwC+WVKuxl1V/8VdVfzFXVX/xV1V/8VdVf/FXVX/xV1V/8VdVf/FXVT/xV5V/8FWTf/DXFT/yWhh/8FWTv/DWVH/xV1V/8ZeVv/GX1f/xl9X/8VdVf/FXVX/xV1V/8VdVfzGXVX/vllSrv95bwD/enACRSAeAB8PDQDIX1YDx15WALlYUGHGXlb/xl5V+sZeVv/GXlb/xl5W/8ZeVv/GXlb/xl5W/8ZeVv/GXlX/x19X/8ZeVf/FW1L/xl9X/8ZfVv/GXlX/xl5W/8ZeVv/GXlX/xl5V/8ZeVv/GXlb/xl5V+sZeVv+5WFBhx15WAMhfVgMfDw0A4nhuAKlQSQFVKCQATyYjBMJcVMbHX1f/xl5W+sZeVvvGXlb9xl5W/cZeVv3GXlb9xl5W/cZeVv3GXlb9xl9X/cdfV/3GXlb9xl5W/cZeVv3GXlb9xl5W/cZeVv3GXlb9xl5W+8ZeVvrHX1f/wlxUxk8mIwRVKCQAqVBJAeJ4bgAKBQQA/97MALVWTwGpT0kArlNMG8NdVcnHX1f/x19X/cdfV//HX1f/x19X/8dfV//HX1f/x19X/8dfV//HX1f/x19X/8dfV//HX1f/x19X/8dfV//HX1f/x19X/8dfV//HX1f9x19X/8NdVcmuU0wbqU9JALVWTwH/3swACgUEAAAAAADKYFgA0WRcALtZUgEAAAAAk0ZBBr9bVF7EXlauxV9XzMZfV9fGX1faxl9X2sZfV9rGX1faxl9X2sZfV9rGX1faxl9X2sZfV9rGX1faxl9X2sZfV9rGX1fXxV9XzMReVq6/W1Rek0dBBgAAAAC7WVIB0WRcAMpgWAAAAAAAAAAAABQKCQDbaWAA22hgAMRdVQLda2IC2GdeAJhJQwAhERAADwgHAS4XFgMyGRcDMRkXAzEZFwMxGRcDMRkXAzEZFwMxGRcDMRkXAzEYFwMyGRcDLhcWAw8IBwEhERAAmElDANhnXgDda2ICxF1VAttoYADbaWAAFQoJAAAAAAAAAAAAAAAAABsNDADMYVkAxV5WAKdQSQHIYFgE3GlgA/+OggH/b2QA8mddAP/m3QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/m3QDyZ10A/29kAP+OggHcaWADyGBYBKdQSQHGXlcAzGJZABsNDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYDAsA/4t/AP///wBzNzMAok5HAKtSSwGsU0wBrFNMAaxTTAGsU0wBrFNMAaxTTAGsU0wBrFNMAaxTTAGsU0wBrFNMAaxTTAGrUksBok5HAHM3MwD///8A/4t/ABgMCwAAAAAAAAAAAAAAAAAAAAAA+AAAH8i//ROSAABJqAAAFZAAAAkgAAAEIAAABCAAAARAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJgAAAGIAAABCAAAASgAAAFkAAACagAABXSgAFL6F/6F/4AAH8='
 
$bitmap = New-Object System.Windows.Media.Imaging.BitmapImage
$bitmap.BeginInit()
$bitmap.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($tmsIconBase64)
$bitmap.EndInit()
$bitmap.Freeze()

$Window.Icon = $bitmap
#endregion 

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #
#----Control Event Handlers
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. #

#region Logic
$customProfiles = Get-CustomProfiles
$hooks = ''

if ($customProfiles) {
  foreach ($cp in $customProfiles) {
    $listProfiles.Items.Add($cp.Name)
  }
} else {
  $listProfiles.Items.Add("No custom profiles found. Please create one.")
}

if ($listProfiles.Items[0] -eq "No custom profiles found. Please create one.") {
	$btnStart.IsEnabled = $false
	$btnCache.IsEnabled = $false
	$btnLocation.IsEnabled = $false
	$listProfiles.IsEnabled = $false
	$chkDev.IsEnabled = $false
	$chkAdal.IsEnabled = $false
}

$listProfiles.Add_SelectionChanged({
  $txtSelectedProfile.text = $listProfiles.selectedItem
  $lblSelectedProfile.content = $txtSelectedProfile.text
	
	$cpFiles = gci -path "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($lblSelectedProfile.content)\AppData\Roaming\Microsoft\Teams"
	foreach ($cpf in $cpFiles) {
		if ($cpf.Name -eq 'hooks.json') {
			$hooks = Get-Content -path "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($lblSelectedProfile.content)\AppData\Roaming\Microsoft\Teams\hooks.json" | ConvertFrom-Json
		}
	}

	# DEV
	if ($hooks.settingsForWebApp -eq 'ring=ring3_6') {
		$chkDev.IsChecked = $true
	} else {
		$chkDev.IsChecked = $false
	}

	# ADAL
	if ($hooks.authHoldUserOnAdal -eq $true -AND $hooks.authMigrationRevertToAdal -eq $true) {
		$chkAdal.IsChecked = $true
	} else {
		$chkAdal.IsChecked = $false
	}

  # write-host $txtSelectedProfile.text
})

$chkDev.Add_Checked({
	write-host 'DEV checked'
	$path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)\AppData\Roaming\Microsoft\Teams\hooks.json"
	
	if ($txtSelectedProfile.text -eq '') {
		Write-Host 'No profile selected to toggled Dev.'
	} else {
		if ($chkAdal.IsChecked) {
			write-host 'adal is checked'
			$hooksJson = '{"settingsForWebApp":"ring=ring3_6", "authHoldUserOnAdal":true, "authMigrationRevertToAdal":true}'

			Out-File -FilePath $path -InputObject $hooksJson
		} else {
			write-host 'adal is not checked'
			$hooksJson = '{"settingsForWebApp":"ring=ring3_6"}'

			Out-File -FilePath $path -InputObject $hooksJson
		}
	}
})

$chkDev.Add_UnChecked({
	write-host 'DEV unchecked'
	$path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)\AppData\Roaming\Microsoft\Teams\hooks.json"

	if ($txtSelectedProfile.text -eq '') {
		Write-Host 'No profile selected to untoggled Dev.'
	} else {
		if ($chkAdal.IsChecked) {
			write-host 'adal is checked'
			$hooksJson = '{"authHoldUserOnAdal":true, "authMigrationRevertToAdal":true}'

			Out-File -FilePath $path -InputObject $hooksJson
		} else {
			write-host 'adal is not checked'
			$hooksJson = ''

			Out-File -FilePath $path -InputObject $hooksJson
		}
	}
})

$chkAdal.Add_Checked({
	write-host 'ADAL checked'
	$path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)\AppData\Roaming\Microsoft\Teams\hooks.json"

	if ($txtSelectedProfile.text -eq '') {
		Write-Host 'No profile selected to toggle Adal.'
	} else {
		if ($chkDev.IsChecked) {
			write-host 'dev is checked'
			$hooksJson = '{"settingsForWebApp":"ring=ring3_6", "authHoldUserOnAdal":true, "authMigrationRevertToAdal":true}'

			Out-File -FilePath $path -InputObject $hooksJson
		} else {
			write-host 'dev is not checked'
			$hooksJson = '{"authHoldUserOnAdal":true, "authMigrationRevertToAdal":true}'

			Out-File -FilePath $path -InputObject $hooksJson
		}
	}
})

$chkAdal.Add_UnChecked({
	write-host 'ADAL unchecked'
	$path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)\AppData\Roaming\Microsoft\Teams\hooks.json"

	if ($txtSelectedProfile.text -eq '') {
		Write-Host 'No profile selected to untoggle Adal.'
	} else {
		if ($chkDev.IsChecked) {
			write-host 'dev is checked'
			$hooksJson = '{"settingsForWebApp":"ring=ring3_6"}'

			Out-File -FilePath $path -InputObject $hooksJson
		} else {
			write-host 'dev is not checked'
			$hooksJson = ''

			Out-File -FilePath $path -InputObject $hooksJson
		}
	}
})

$btnStart.Add_Click({
  $scriptPath = "$($HOME)\Documents\WindowsPowerShell\tms-CustomProfiles.ps1"

  if ($txtSelectedProfile.text -eq "") {
    Write-Host 'No profile selected to start.'
  } else {
    Write-Host "Starting profile $($txtSelectedProfile.text)"
    New-CustomProfile $txtSelectedProfile.text
  } 
})

$btnCache.Add_Click({
  $path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)\AppData\Roaming\Microsoft\Teams"

  if ($txtSelectedProfile.text -eq "") {
    Write-Host 'No profile selected to clear cache.'
  } else {
    gci -path $path | foreach { Remove-Item $_.FullName -Recurse -Force }
    Write-Host "Cleared cache for profile $($txtSelectedProfile.text)"
  } 
})

$btnLocation.Add_Click({
  if ($txtSelectedProfile.text -eq "") {
    Write-Host 'No profile selected to open location.'
  } else {
    Invoke-Item "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtSelectedProfile.text)"
    Write-Host "Location opened for profile $($txtSelectedProfile.text)"
  }
})

$btnCreate.Add_Click({
  $scriptPath = "$($HOME)\Documents\WindowsPowerShell\tms-CustomProfiles.ps1"
  $profileName = $txtNewProfile.Text

	if ($listProfiles.Items[0] -eq "No custom profiles found. Please create one.") {
		$listProfiles.Items.Clear()
		$btnStart.IsEnabled = $true
		$btnCache.IsEnabled = $true
		$btnLocation.IsEnabled = $true
		$listProfiles.IsEnabled = $true
		$chkDev.IsEnabled = $true
		$chkAdal.IsEnabled = $true
	}

  if ($profileName -eq "") {
    Write-Host 'No profile name to create profile.'
  } else {
    write-host "Created profile $($txtNewProfile.Text)"
    $listProfiles.Items.Add($profileName)
    New-CustomProfile $profileName
  }
})

#endregion 

$Window.ShowDialog()
