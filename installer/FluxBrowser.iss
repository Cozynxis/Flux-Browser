#define MyAppName "Flux Browser"
#define MyAppVersion "0.2.0"
#define MyAppPublisher "Flux"
#define MyAppExeName "Flux.exe"
[Setup]
AppId={{B517A193-4DB0-4E5E-AE89-F64C5D8D0C22}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={localappdata}\Programs\Flux Browser
DefaultGroupName=Flux Browser
OutputDir=..\artifacts\installer
OutputBaseFilename=FluxSetup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
Uninstallable=yes
UninstallDisplayName=Flux Browser
CloseApplications=yes
RestartApplications=no
SetupLogging=yes
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
[Tasks]
Name: "desktopicon"; Description: "Add Flux to my desktop"; GroupDescription: "Shortcuts:"; Flags: unchecked
Name: "quicklaunchicon"; Description: "Pin a Flux shortcut in my user shortcuts"; GroupDescription: "Shortcuts:"; Flags: unchecked
[Files]
Source: "..\artifacts\publish\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
[Icons]
Name: "{autoprograms}\Flux Browser"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\Flux Browser"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Open Flux Browser"; Flags: nowait postinstall skipifsilent
[UninstallDelete]
Type: filesandordirs; Name: "{app}"
Type: filesandordirs; Name: "{localappdata}\Flux Browser"
Type: filesandordirs; Name: "{userappdata}\Flux Browser"
[Code]
procedure InitializeWizard;
begin
 WizardForm.Caption := 'Flux Setup';
 WizardForm.WelcomeLabel1.Caption := 'Welcome to Flux';
 WizardForm.WelcomeLabel2.Caption := 'A fast, personal browser built around you.' + #13#10 + #13#10 + 'Setup will install Flux Browser on this PC. You can remove Flux later from Windows Installed apps; uninstalling also removes local Flux browser data.';
 WizardForm.FinishedLabel.Caption := 'Flux is ready.' + #13#10 + 'Your new browser has been installed successfully.';
 WizardForm.Color := $171611;
 WizardForm.WelcomeLabel1.Font.Size := 24;
 WizardForm.WelcomeLabel1.Font.Style := [fsBold];
end;
function InitializeUninstall(): Boolean;
begin
 Result := MsgBox('Remove Flux Browser?' + #13#10 + #13#10 + 'This removes the application and local Flux data such as settings, history and bookmarks.', mbConfirmation, MB_YESNO) = IDYES;
end;
