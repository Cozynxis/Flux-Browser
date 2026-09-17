using Microsoft.Web.WebView2.Core;
using System.Windows;
using System.Windows.Input;
namespace FluxBrowser;
public partial class MainWindow : Window
{
 public MainWindow(){InitializeComponent(); Loaded += async (_,__) => await InitializeBrowser();}
 async Task InitializeBrowser(){await Browser.EnsureCoreWebView2Async(); Browser.CoreWebView2.Settings.AreDevToolsEnabled=true; Browser.CoreWebView2.DocumentTitleChanged += (_,__)=>Dispatcher.Invoke(()=>TabTitle.Text="  "+Browser.CoreWebView2.DocumentTitle); Browser.CoreWebView2.SourceChanged += (_,__)=>Dispatcher.Invoke(()=>AddressBar.Text=Browser.Source?.ToString()??""); Navigate("https://www.google.com");}
 void Navigate(string input){if(string.IsNullOrWhiteSpace(input))return; var value=input.Trim(); if(!value.Contains('.') || value.Contains(' ')) value="https://www.google.com/search?q="+Uri.EscapeDataString(value); else if(!value.StartsWith("http://")&&!value.StartsWith("https://")) value="https://"+value; Browser.Source=new Uri(value);}
 void AddressBar_KeyDown(object sender, KeyEventArgs e){if(e.Key==Key.Enter){Navigate(AddressBar.Text); Keyboard.ClearFocus();}}
 void Back_Click(object sender,RoutedEventArgs e){if(Browser.CanGoBack)Browser.GoBack();}
 void Forward_Click(object sender,RoutedEventArgs e){if(Browser.CanGoForward)Browser.GoForward();}
 void Reload_Click(object sender,RoutedEventArgs e)=>Browser.Reload();
 void NewTab_Click(object sender,RoutedEventArgs e){var w=new MainWindow();w.Show();}
 void Bookmark_Click(object sender,RoutedEventArgs e)=>MessageBox.Show("Bookmark saved locally (Flux V1 placeholder).","Flux");
 void Menu_Click(object sender,RoutedEventArgs e)=>MessageBox.Show("Flux Browser V0.1\n\nHistory, Bookmarks, Private Mode, PDF, Accounts, Sync and Extensions framework are being built into V1.","Flux");
}