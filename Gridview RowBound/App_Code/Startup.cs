using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Gridview_RowBound.Startup))]
namespace Gridview_RowBound
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
