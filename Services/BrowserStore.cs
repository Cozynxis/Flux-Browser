using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;

namespace FluxBrowser.Services;

public sealed class BrowserStore
{
    public string Root { get; } = Path.Combine(
        Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
        "Flux Browser");

    public string HistoryFile => Path.Combine(Root, "history.json");
    public string BookmarksFile => Path.Combine(Root, "bookmarks.json");
    public string SettingsFile => Path.Combine(Root, "settings.json");

    public BrowserStore() => Directory.CreateDirectory(Root);

    public List<T> Load<T>(string path)
    {
        try
        {
            return File.Exists(path)
                ? JsonSerializer.Deserialize<List<T>>(File.ReadAllText(path)) ?? new List<T>()
                : new List<T>();
        }
        catch { return new List<T>(); }
    }

    public void Save<T>(string path, IEnumerable<T> value) =>
        File.WriteAllText(path, JsonSerializer.Serialize(value,
            new JsonSerializerOptions { WriteIndented = true }));

    public T LoadObject<T>(string path, T fallback)
    {
        try
        {
            return File.Exists(path)
                ? JsonSerializer.Deserialize<T>(File.ReadAllText(path)) ?? fallback
                : fallback;
        }
        catch { return fallback; }
    }

    public void SaveObject<T>(string path, T value) =>
        File.WriteAllText(path, JsonSerializer.Serialize(value,
            new JsonSerializerOptions { WriteIndented = true }));
}

public record HistoryItem(string Title, string Url, DateTime VisitedAt);
public record BookmarkItem(string Title, string Url);

public sealed class FluxSettings
{
    public string SearchEngine { get; set; } = "Google";
    public string Accent { get; set; } = "#7C5CFC";
    public bool ShowClock { get; set; } = true;
    public bool ShowGreeting { get; set; } = true;
    public bool ShowQuickLinks { get; set; } = true;
    public string Background { get; set; } = "Midnight";
}
