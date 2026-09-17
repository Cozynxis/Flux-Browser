# Flux Browser

Flux is a custom Windows browser built with C#, WPF and Microsoft WebView2.

## V1 goals
- Custom Flux Windows 11-style interface
- Chromium/WebView2 rendering
- Address/search bar and navigation
- Real multi-tab architecture
- History and bookmarks
- Private browsing
- PDF support
- Customizable New Tab
- Flux Accounts + sync architecture
- Search engine selection
- Privacy/site permission controls
- Extension framework (installation/support arrives in V2)
- GitHub Releases update checks
- Flux Setup Wizard / installer

## Run
Install the .NET 8 SDK, then run:

```powershell
dotnet restore
dotnet run
```

WebView2 Runtime is normally already installed on Windows 11.

## Status
Early V0.1 foundation. The current code provides the first functional WebView2 browser shell; V1 systems are being implemented incrementally.