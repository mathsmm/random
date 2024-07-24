﻿// <auto-generated />
using EscolaApexWebApi.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace EscolaApexWebApi.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20201127230036_MigrationInicial")]
    partial class MigrationInicial
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .UseIdentityColumns()
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.0");

            modelBuilder.Entity("EscolaApexWebApi.Models.Aluno", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sobrenome")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Telefone")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Aluno");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Nome = "Marta",
                            Sobrenome = "Kent",
                            Telefone = "33225555"
                        },
                        new
                        {
                            Id = 2,
                            Nome = "Paula",
                            Sobrenome = "Isabela",
                            Telefone = "3354288"
                        },
                        new
                        {
                            Id = 3,
                            Nome = "Laura",
                            Sobrenome = "Antonia",
                            Telefone = "55668899"
                        },
                        new
                        {
                            Id = 4,
                            Nome = "Luiza",
                            Sobrenome = "Maria",
                            Telefone = "6565659"
                        },
                        new
                        {
                            Id = 5,
                            Nome = "Lucas",
                            Sobrenome = "Machado",
                            Telefone = "565685415"
                        },
                        new
                        {
                            Id = 6,
                            Nome = "Pedro",
                            Sobrenome = "Alvares",
                            Telefone = "456454545"
                        },
                        new
                        {
                            Id = 7,
                            Nome = "Paulo",
                            Sobrenome = "José",
                            Telefone = "9874512"
                        });
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.AlunoDisciplina", b =>
                {
                    b.Property<int>("AlunoId")
                        .HasColumnType("int");

                    b.Property<int>("DisciplinaId")
                        .HasColumnType("int");

                    b.HasKey("AlunoId", "DisciplinaId");

                    b.HasIndex("DisciplinaId");

                    b.ToTable("AlunoDisciplina");

                    b.HasData(
                        new
                        {
                            AlunoId = 1,
                            DisciplinaId = 2
                        },
                        new
                        {
                            AlunoId = 1,
                            DisciplinaId = 4
                        },
                        new
                        {
                            AlunoId = 1,
                            DisciplinaId = 5
                        },
                        new
                        {
                            AlunoId = 2,
                            DisciplinaId = 1
                        },
                        new
                        {
                            AlunoId = 2,
                            DisciplinaId = 2
                        },
                        new
                        {
                            AlunoId = 2,
                            DisciplinaId = 5
                        },
                        new
                        {
                            AlunoId = 3,
                            DisciplinaId = 1
                        },
                        new
                        {
                            AlunoId = 3,
                            DisciplinaId = 2
                        },
                        new
                        {
                            AlunoId = 3,
                            DisciplinaId = 3
                        },
                        new
                        {
                            AlunoId = 4,
                            DisciplinaId = 1
                        },
                        new
                        {
                            AlunoId = 4,
                            DisciplinaId = 4
                        },
                        new
                        {
                            AlunoId = 4,
                            DisciplinaId = 5
                        },
                        new
                        {
                            AlunoId = 5,
                            DisciplinaId = 4
                        },
                        new
                        {
                            AlunoId = 5,
                            DisciplinaId = 5
                        },
                        new
                        {
                            AlunoId = 6,
                            DisciplinaId = 1
                        },
                        new
                        {
                            AlunoId = 6,
                            DisciplinaId = 2
                        },
                        new
                        {
                            AlunoId = 6,
                            DisciplinaId = 3
                        },
                        new
                        {
                            AlunoId = 6,
                            DisciplinaId = 4
                        },
                        new
                        {
                            AlunoId = 7,
                            DisciplinaId = 1
                        },
                        new
                        {
                            AlunoId = 7,
                            DisciplinaId = 2
                        },
                        new
                        {
                            AlunoId = 7,
                            DisciplinaId = 3
                        },
                        new
                        {
                            AlunoId = 7,
                            DisciplinaId = 4
                        },
                        new
                        {
                            AlunoId = 7,
                            DisciplinaId = 5
                        });
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Disciplina", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProfessorId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ProfessorId");

                    b.ToTable("Disciplina");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Nome = "Matemática",
                            ProfessorId = 1
                        },
                        new
                        {
                            Id = 2,
                            Nome = "Física",
                            ProfessorId = 2
                        },
                        new
                        {
                            Id = 3,
                            Nome = "Português",
                            ProfessorId = 3
                        },
                        new
                        {
                            Id = 4,
                            Nome = "Inglês",
                            ProfessorId = 4
                        },
                        new
                        {
                            Id = 5,
                            Nome = "Programação",
                            ProfessorId = 5
                        });
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Professor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .UseIdentityColumn();

                    b.Property<string>("Nome")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Professor");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            Nome = "Lauro"
                        },
                        new
                        {
                            Id = 2,
                            Nome = "Roberto"
                        },
                        new
                        {
                            Id = 3,
                            Nome = "Ronaldo"
                        },
                        new
                        {
                            Id = 4,
                            Nome = "Rodrigo"
                        },
                        new
                        {
                            Id = 5,
                            Nome = "Alexandre"
                        });
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.AlunoDisciplina", b =>
                {
                    b.HasOne("EscolaApexWebApi.Models.Aluno", "Aluno")
                        .WithMany("AlunosDisciplinas")
                        .HasForeignKey("AlunoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("EscolaApexWebApi.Models.Disciplina", "Disciplina")
                        .WithMany("AlunosDisciplinas")
                        .HasForeignKey("DisciplinaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Aluno");

                    b.Navigation("Disciplina");
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Disciplina", b =>
                {
                    b.HasOne("EscolaApexWebApi.Models.Professor", "Professor")
                        .WithMany("Disciplinas")
                        .HasForeignKey("ProfessorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Professor");
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Aluno", b =>
                {
                    b.Navigation("AlunosDisciplinas");
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Disciplina", b =>
                {
                    b.Navigation("AlunosDisciplinas");
                });

            modelBuilder.Entity("EscolaApexWebApi.Models.Professor", b =>
                {
                    b.Navigation("Disciplinas");
                });
#pragma warning restore 612, 618
        }
    }
}
