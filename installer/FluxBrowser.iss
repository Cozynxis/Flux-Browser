#define MyAppName "Flux Browser"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "Flux"
#define MyAppExeName "Flux.exe"

[Setup]
AppId={{B517A193-4DB0-4E5E-AE89-F64C5D8D0C22}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\Flux Browser
DefaultGroupName=Flux Browser
DisableProgramGroupPage=yes
OutputDir=..\artifacts\installer
OutputBaseFilename=FluxSetup
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayName=Flux Browser
Uninstallable=yes
CreateUninstallRegKey=yes
SetupLogging=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Shortcuts:"; Flags: unchecked
Name: "startmenu"; Description: "Create a Start menu shortcut"; GroupDescription: "Shortcuts:"

[Files]
Source: "..\artifacts\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\Flux Browser"; Filename: "{app}\{#MyAppExeName}"; Tasks: startmenu
Name: "{autodesktop}\Flux Browser"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch Flux Browser"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: filesandordirs; Name: "{localappdata}\Flux Browser"
Type: filesandordirs; Name: "{userappdata}\Flux Browser"

[Code]
function InitializeSetup(): Boolean;
var
  UninstallKey: String;
begin
  Result := True;
  UninstallKey := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{B517A193-4DB0-4E5E-AE89-F64C5D8D0C22}_is1';
  if RegKeyExists(HKCU, UninstallKey) or RegKeyExists(HKLM, UninstallKey) then
  begin
    if MsgBox('Flux Browser is already installed.' + #13#10 + #13#10 +
      'Choose Yes to continue with maintenance/reinstallation. To completely remove Flux, use Windows Settings > Apps > Installed apps > Flux Browser > Uninstall.',
      mbInformation, MB_YESNO) = IDNO then
      Result := False;
  end;
end;
