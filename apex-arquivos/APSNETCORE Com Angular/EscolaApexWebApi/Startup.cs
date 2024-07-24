using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EscolaApexWebApi.Data;
using EscolaApexWebApi.Data.Interfaces;
using EscolaApexWebApi.Data.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace EscolaApexWebApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddDbContext<DataContext>(
                opt => opt.UseSqlServer(
                    Configuration.GetConnectionString("ConexaoBase")
                )
            );
            // Foi adicionado isto depois: dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson --version 3.1.7

            services.AddControllers()
                    .AddNewtonsoftJson(
                        opt => opt.SerializerSettings.ReferenceLoopHandling = 
                            ReferenceLoopHandling.Ignore
                    );
            // Isto é para não ficar dando loop quando o controlador trazer as informações

            services.AddScoped<IRepositorio, Repositorio>();
            services.AddScoped<IRepositorioAluno, RepositorioAluno>();
            services.AddScoped<IRepositorioProfessor, RepositorioProfessor>();
            services.AddScoped<IRepositorioDisciplina, RepositorioDisciplina>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseCors(
                c => c.AllowAnyOrigin()
                      .AllowAnyMethod()
                      .AllowAnyHeader()
            );

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
