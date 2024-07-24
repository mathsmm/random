using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Training_API.Migrations
{
    public partial class InitialMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Person",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Surname = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Person", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RestRoom",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Capacity = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RestRoom", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RestTime",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StartingDateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndingDateTime = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RestTime", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "StageTime",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StartingDateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndingDateTime = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StageTime", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "TrainingRoom",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Capacity = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrainingRoom", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RestRoomPerson",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RestTimeId = table.Column<int>(type: "int", nullable: false),
                    RestRoomId = table.Column<int>(type: "int", nullable: false),
                    PersonId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RestRoomPerson", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RestRoomPerson_Person_PersonId",
                        column: x => x.PersonId,
                        principalTable: "Person",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RestRoomPerson_RestRoom_RestRoomId",
                        column: x => x.RestRoomId,
                        principalTable: "RestRoom",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_RestRoomPerson_RestTime_RestTimeId",
                        column: x => x.RestTimeId,
                        principalTable: "RestTime",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "TrainingRoomPerson",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StageTimeId = table.Column<int>(type: "int", nullable: false),
                    TrainingRoomId = table.Column<int>(type: "int", nullable: false),
                    PersonId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TrainingRoomPerson", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TrainingRoomPerson_Person_PersonId",
                        column: x => x.PersonId,
                        principalTable: "Person",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TrainingRoomPerson_StageTime_StageTimeId",
                        column: x => x.StageTimeId,
                        principalTable: "StageTime",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TrainingRoomPerson_TrainingRoom_TrainingRoomId",
                        column: x => x.TrainingRoomId,
                        principalTable: "TrainingRoom",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Person",
                columns: new[] { "Id", "Name", "Surname" },
                values: new object[,]
                {
                    { 1, "Matheus", "Marchi Moro" },
                    { 2, "Cristina", "da Silva" },
                    { 3, "Eduardo", "Pereira" },
                    { 4, "Bárbara", "de Souza" },
                    { 5, "Thomas", "Cruz" },
                    { 6, "Norman", "Reedus" }
                });

            migrationBuilder.InsertData(
                table: "RestRoom",
                columns: new[] { "Id", "Capacity", "Name" },
                values: new object[,]
                {
                    { 1, 25, "Espaço 1" },
                    { 2, 30, "Espaço 2" },
                    { 3, 35, "Espaço 3" }
                });

            migrationBuilder.InsertData(
                table: "RestTime",
                columns: new[] { "Id", "EndingDateTime", "StartingDateTime" },
                values: new object[,]
                {
                    { 1, new DateTime(2021, 4, 18, 15, 30, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 18, 15, 15, 0, 0, DateTimeKind.Unspecified) },
                    { 2, new DateTime(2021, 4, 19, 17, 15, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 19, 17, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "StageTime",
                columns: new[] { "Id", "EndingDateTime", "StartingDateTime" },
                values: new object[,]
                {
                    { 1, new DateTime(2021, 4, 18, 18, 15, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 18, 14, 15, 0, 0, DateTimeKind.Unspecified) },
                    { 2, new DateTime(2021, 4, 19, 18, 15, 0, 0, DateTimeKind.Unspecified), new DateTime(2021, 4, 19, 14, 15, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.InsertData(
                table: "TrainingRoom",
                columns: new[] { "Id", "Capacity", "Name" },
                values: new object[,]
                {
                    { 1, 10, "Sala 1" },
                    { 2, 15, "Sala 2" },
                    { 3, 20, "Sala 3" }
                });

            migrationBuilder.InsertData(
                table: "RestRoomPerson",
                columns: new[] { "Id", "PersonId", "RestRoomId", "RestTimeId" },
                values: new object[,]
                {
                    { 1, 1, 1, 1 },
                    { 2, 2, 1, 1 },
                    { 3, 3, 2, 1 },
                    { 4, 4, 2, 1 },
                    { 5, 1, 2, 2 },
                    { 6, 2, 2, 2 },
                    { 7, 3, 1, 2 },
                    { 8, 4, 1, 2 }
                });

            migrationBuilder.InsertData(
                table: "TrainingRoomPerson",
                columns: new[] { "Id", "PersonId", "StageTimeId", "TrainingRoomId" },
                values: new object[,]
                {
                    { 1, 1, 1, 1 },
                    { 2, 2, 1, 1 },
                    { 5, 1, 2, 1 },
                    { 8, 4, 2, 1 },
                    { 3, 3, 1, 2 },
                    { 4, 4, 1, 2 },
                    { 6, 2, 2, 2 },
                    { 7, 3, 2, 2 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_RestRoomPerson_PersonId",
                table: "RestRoomPerson",
                column: "PersonId");

            migrationBuilder.CreateIndex(
                name: "IX_RestRoomPerson_RestRoomId",
                table: "RestRoomPerson",
                column: "RestRoomId");

            migrationBuilder.CreateIndex(
                name: "IX_RestRoomPerson_RestTimeId",
                table: "RestRoomPerson",
                column: "RestTimeId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRoomPerson_PersonId",
                table: "TrainingRoomPerson",
                column: "PersonId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRoomPerson_StageTimeId",
                table: "TrainingRoomPerson",
                column: "StageTimeId");

            migrationBuilder.CreateIndex(
                name: "IX_TrainingRoomPerson_TrainingRoomId",
                table: "TrainingRoomPerson",
                column: "TrainingRoomId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "RestRoomPerson");

            migrationBuilder.DropTable(
                name: "TrainingRoomPerson");

            migrationBuilder.DropTable(
                name: "RestRoom");

            migrationBuilder.DropTable(
                name: "RestTime");

            migrationBuilder.DropTable(
                name: "Person");

            migrationBuilder.DropTable(
                name: "StageTime");

            migrationBuilder.DropTable(
                name: "TrainingRoom");
        }
    }
}
