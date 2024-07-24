﻿using Microsoft.EntityFrameworkCore.Migrations;

namespace EscolaApexWebApi.Migrations
{
    public partial class MigrationInicial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Aluno",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Sobrenome = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Telefone = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Aluno", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Professor",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Professor", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Disciplina",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ProfessorId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Disciplina", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Disciplina_Professor_ProfessorId",
                        column: x => x.ProfessorId,
                        principalTable: "Professor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AlunoDisciplina",
                columns: table => new
                {
                    AlunoId = table.Column<int>(type: "int", nullable: false),
                    DisciplinaId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AlunoDisciplina", x => new { x.AlunoId, x.DisciplinaId });
                    table.ForeignKey(
                        name: "FK_AlunoDisciplina_Aluno_AlunoId",
                        column: x => x.AlunoId,
                        principalTable: "Aluno",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AlunoDisciplina_Disciplina_DisciplinaId",
                        column: x => x.DisciplinaId,
                        principalTable: "Disciplina",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Aluno",
                columns: new[] { "Id", "Nome", "Sobrenome", "Telefone" },
                values: new object[,]
                {
                    { 1, "Marta", "Kent", "33225555" },
                    { 2, "Paula", "Isabela", "3354288" },
                    { 3, "Laura", "Antonia", "55668899" },
                    { 4, "Luiza", "Maria", "6565659" },
                    { 5, "Lucas", "Machado", "565685415" },
                    { 6, "Pedro", "Alvares", "456454545" },
                    { 7, "Paulo", "José", "9874512" }
                });

            migrationBuilder.InsertData(
                table: "Professor",
                columns: new[] { "Id", "Nome" },
                values: new object[,]
                {
                    { 1, "Lauro" },
                    { 2, "Roberto" },
                    { 3, "Ronaldo" },
                    { 4, "Rodrigo" },
                    { 5, "Alexandre" }
                });

            migrationBuilder.InsertData(
                table: "Disciplina",
                columns: new[] { "Id", "Nome", "ProfessorId" },
                values: new object[,]
                {
                    { 1, "Matemática", 1 },
                    { 2, "Física", 2 },
                    { 3, "Português", 3 },
                    { 4, "Inglês", 4 },
                    { 5, "Programação", 5 }
                });

            migrationBuilder.InsertData(
                table: "AlunoDisciplina",
                columns: new[] { "AlunoId", "DisciplinaId" },
                values: new object[,]
                {
                    { 2, 1 },
                    { 4, 5 },
                    { 2, 5 },
                    { 1, 5 },
                    { 7, 4 },
                    { 6, 4 },
                    { 5, 4 },
                    { 4, 4 },
                    { 1, 4 },
                    { 7, 3 },
                    { 5, 5 },
                    { 6, 3 },
                    { 7, 2 },
                    { 6, 2 },
                    { 3, 2 },
                    { 2, 2 },
                    { 1, 2 },
                    { 7, 1 },
                    { 6, 1 },
                    { 4, 1 },
                    { 3, 1 },
                    { 3, 3 },
                    { 7, 5 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_AlunoDisciplina_DisciplinaId",
                table: "AlunoDisciplina",
                column: "DisciplinaId");

            migrationBuilder.CreateIndex(
                name: "IX_Disciplina_ProfessorId",
                table: "Disciplina",
                column: "ProfessorId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AlunoDisciplina");

            migrationBuilder.DropTable(
                name: "Aluno");

            migrationBuilder.DropTable(
                name: "Disciplina");

            migrationBuilder.DropTable(
                name: "Professor");
        }
    }
}
