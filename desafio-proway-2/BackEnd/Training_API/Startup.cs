using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
using Training_API.Data;
using Training_API.Data.Interfaces;
using Training_API.Data.Services;
using Training_API.Data.Services.Verification;

namespace Training_API
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
                options => options.UseSqlServer(
                    Configuration.GetConnectionString("Connection")
                )
            );

            services.AddControllers()
                    .AddNewtonsoftJson(
                        opt => opt.SerializerSettings.ReferenceLoopHandling = 
                            ReferenceLoopHandling.Ignore
                    );

            services.AddScoped<IRepository, RepositoryService>();
            services.AddScoped<IPerson, PersonService>();
            services.AddScoped<IRestRoom, RestRoomService>();
            services.AddScoped<IRestRoomPerson, RestRoomPersonService>();
            services.AddScoped<IRestTime, RestTimeService>();
            services.AddScoped<IStageTime, StageTimeService>();
            services.AddScoped<ITrainingRoom, TrainingRoomService>();
            services.AddScoped<ITrainingRoomPerson, TrainingRoomPersonService>();
            services.AddScoped<VerificationService>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            // app.UseHttpsRedirection();

            app.UseRouting();

            // app.UseAuthorization();

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
