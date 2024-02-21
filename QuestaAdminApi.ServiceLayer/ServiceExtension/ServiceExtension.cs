using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using QuestaAdminApi.ServiceLayer.Interface;
using QuestaAdminApi.ServiceLayer.Service;


namespace QuestaAdminApi.ServiceLayer.ServiceExtension
{
    public static class ServiceExtension
    {
        public static IServiceCollection DependancyInjection(this IServiceCollection service,IConfiguration configuration)
        {
            service.AddSingleton<ICrendential, ClsCrendential>();
            service.AddScoped<IJsonConverter, ClsJsonConverter>();

            return service;
        }
    }
}
