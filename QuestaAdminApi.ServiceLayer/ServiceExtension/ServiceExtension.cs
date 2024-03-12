using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuestaAdminApi.ServiceLayer.Service;


namespace QuestaAdminApi.ServiceLayer.ServiceExtension
{
    public static class ServiceExtension
    {
        public static IServiceCollection DependancyInjection(this IServiceCollection service,IConfiguration configuration)
        {
            service.AddSingleton<ICrendential, ClsCrendential>();
            service.AddSingleton<IAesOperation, ClsAesOperation>();
            service.AddSingleton<IJsonConverter, ClsJsonConverter>();
            service.AddSingleton<IMaster, ClsMasterData>();
            service.AddSingleton<ILinkGeneration, ClsLinkGeneration>();

            return service;
        }
    }
}
