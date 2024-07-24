using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Training_API.Models;

namespace Training_API.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) {}
        public DbSet<Person> Person { get; set; }
        public DbSet<TrainingRoom> TrainingRoom { get; set; }
        public DbSet<TrainingRoomPerson> TrainingRoomPerson { get; set; }
        public DbSet<RestRoom> RestRoom { get; set; }
        public DbSet<RestRoomPerson> RestRoomPerson { get; set; }
        public DbSet<StageTime> StageTime { get; set; }
        public DbSet<RestTime> RestTime { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Person>()
                .HasData(new List<Person>() {
                    new Person(1, "Matheus", "Marchi Moro"),
                    new Person(2, "Cristina", "da Silva"),
                    new Person(3, "Eduardo", "Pereira"),
                    new Person(4, "Bárbara", "de Souza"),
                    new Person(5, "Thomas", "Cruz"),
                    new Person(6, "Norman", "Reedus")
                });

            builder.Entity<StageTime>()
                .HasData(new List<StageTime>() {
                    //               new DateTime(year, month, day, hour, minute, second)
                    new StageTime(1, new DateTime(2021, 04, 18, 14, 15, 0), new DateTime(2021, 04, 18, 18, 15, 0)),
                    new StageTime(2, new DateTime(2021, 04, 19, 14, 15, 0), new DateTime(2021, 04, 19, 18, 15, 0))
                });

            builder.Entity<RestTime>()
                .HasData(new List<RestTime>() {
                    //              new DateTime(year, month, day, hour, minute, second)
                    new RestTime(1, new DateTime(2021, 04, 18, 15, 15, 0), new DateTime(2021, 04, 18, 15, 30, 0)),
                    new RestTime(2, new DateTime(2021, 04, 19, 17, 0, 0), new DateTime(2021, 04, 19, 17, 15, 0))
                });

            builder.Entity<TrainingRoom>()
                .HasData(new List<TrainingRoom>() {
                    new TrainingRoom(1, "Sala 1", 10),
                    new TrainingRoom(2, "Sala 2", 15),
                    new TrainingRoom(3, "Sala 3", 20)
                });

            builder.Entity<RestRoom>()
                .HasData(new List<RestRoom>() {
                    new RestRoom(1, "Espaço 1", 25),
                    new RestRoom(2, "Espaço 2", 30),
                    new RestRoom(3, "Espaço 3", 35)
                });

            builder.Entity<TrainingRoomPerson>()
                .HasData(new List<TrainingRoomPerson>() {
                    new TrainingRoomPerson(1, 1, 1, 1),
                    new TrainingRoomPerson(2, 1, 1, 2),
                    new TrainingRoomPerson(3, 1, 2, 3),
                    new TrainingRoomPerson(4, 1, 2, 4),
                    new TrainingRoomPerson(5, 2, 1, 1),
                    new TrainingRoomPerson(6, 2, 2, 2),
                    new TrainingRoomPerson(7, 2, 2, 3),
                    new TrainingRoomPerson(8, 2, 1, 4)
                });

            builder.Entity<RestRoomPerson>()
                .HasData(new List<RestRoomPerson>() {
                    new RestRoomPerson(1, 1, 1, 1),
                    new RestRoomPerson(2, 1, 1, 2),
                    new RestRoomPerson(3, 1, 2, 3),
                    new RestRoomPerson(4, 1, 2, 4),
                    new RestRoomPerson(5, 2, 2, 1),
                    new RestRoomPerson(6, 2, 2, 2),
                    new RestRoomPerson(7, 2, 1, 3),
                    new RestRoomPerson(8, 2, 1, 4)
                });
        }
    }
}