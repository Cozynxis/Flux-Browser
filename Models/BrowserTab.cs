using Microsoft.Web.WebView2.Wpf;
namespace FluxBrowser.Models;
public sealed class BrowserTab
{
 public Guid Id {get;}=Guid.NewGuid(); public string Title {get;set;}="New Tab"; public string Url {get;set;}="flux://newtab"; public WebView2 View {get;}=new(); public bool IsPrivate {get;init;}
 public override string ToString()=>Title;
}
