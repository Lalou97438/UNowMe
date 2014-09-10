using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(UNowMe.Startup))]
namespace UNowMe
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
