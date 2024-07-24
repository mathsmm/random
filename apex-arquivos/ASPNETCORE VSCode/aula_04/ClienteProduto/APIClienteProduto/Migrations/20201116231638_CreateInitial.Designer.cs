﻿// <auto-generated />
using APIClienteProduto.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace APIClienteProduto.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20201116231638_CreateInitial")]
    partial class CreateInitial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.0");

            modelBuilder.Entity("APIClienteProduto.Models.Client", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Cpf")
                        .IsRequired()
                        .HasMaxLength(11)
                        .HasColumnType("VARCHAR(11)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("VARCHAR(70)");

                    b.HasKey("Id");

                    b.ToTable("Client");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Cpf = "11111111111",
                            Name = "Diego"
                        },
                        new
                        {
                            Id = 2,
                            Cpf = "11111111112",
                            Name = "Felipe"
                        },
                        new
                        {
                            Id = 3,
                            Cpf = "11111111113",
                            Name = "Matheus"
                        },
                        new
                        {
                            Id = 4,
                            Cpf = "11111111114",
                            Name = "Marcela"
                        });
                });

            modelBuilder.Entity("APIClienteProduto.Models.Product", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<int>("ClientId")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("VARCHAR(100)");

                    b.Property<decimal>("Value")
                        .HasColumnType("decimal(18,2)");

                    b.HasKey("Id");

                    b.HasIndex("ClientId");

                    b.ToTable("Product");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            ClientId = 1,
                            Description = "Batata",
                            Value = 4m
                        },
                        new
                        {
                            Id = 2,
                            ClientId = 1,
                            Description = "Arroz",
                            Value = 6m
                        },
                        new
                        {
                            Id = 3,
                            ClientId = 1,
                            Description = "Macarrão",
                            Value = 5m
                        },
                        new
                        {
                            Id = 4,
                            ClientId = 2,
                            Description = "Pãozinho",
                            Value = 8m
                        },
                        new
                        {
                            Id = 5,
                            ClientId = 2,
                            Description = "Alcatra",
                            Value = 45m
                        },
                        new
                        {
                            Id = 6,
                            ClientId = 3,
                            Description = "Feijão",
                            Value = 9m
                        },
                        new
                        {
                            Id = 7,
                            ClientId = 3,
                            Description = "Carvão",
                            Value = 15m
                        },
                        new
                        {
                            Id = 8,
                            ClientId = 4,
                            Description = "Couve-flor",
                            Value = 7m
                        },
                        new
                        {
                            Id = 9,
                            ClientId = 4,
                            Description = "Brócolis",
                            Value = 2m
                        },
                        new
                        {
                            Id = 10,
                            ClientId = 4,
                            Description = "Cerveja",
                            Value = 32m
                        });
                });

            modelBuilder.Entity("APIClienteProduto.Models.Product", b =>
                {
                    b.HasOne("APIClienteProduto.Models.Client", "Client")
                        .WithMany("Product")
                        .HasForeignKey("ClientId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Client");
                });

            modelBuilder.Entity("APIClienteProduto.Models.Client", b =>
                {
                    b.Navigation("Product");
                });
#pragma warning restore 612, 618
        }
    }
}
