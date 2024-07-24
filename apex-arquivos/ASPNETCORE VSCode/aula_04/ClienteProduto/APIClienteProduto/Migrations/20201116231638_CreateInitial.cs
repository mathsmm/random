using Microsoft.EntityFrameworkCore.Migrations;

namespace APIClienteProduto.Migrations
{
    public partial class CreateInitial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Client",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "VARCHAR(70)", nullable: false),
                    Cpf = table.Column<string>(type: "VARCHAR(11)", maxLength: 11, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Client", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(type: "VARCHAR(100)", nullable: false),
                    Value = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    ClientId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Product", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Product_Client_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Client",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Client",
                columns: new[] { "Id", "Cpf", "Name" },
                values: new object[,]
                {
                    { 1, "11111111111", "Diego" },
                    { 2, "11111111112", "Felipe" },
                    { 3, "11111111113", "Matheus" },
                    { 4, "11111111114", "Marcela" }
                });

            migrationBuilder.InsertData(
                table: "Product",
                columns: new[] { "Id", "ClientId", "Description", "Value" },
                values: new object[,]
                {
                    { 1, 1, "Batata", 4m },
                    { 2, 1, "Arroz", 6m },
                    { 3, 1, "Macarrão", 5m },
                    { 4, 2, "Pãozinho", 8m },
                    { 5, 2, "Alcatra", 45m },
                    { 6, 3, "Feijão", 9m },
                    { 7, 3, "Carvão", 15m },
                    { 8, 4, "Couve-flor", 7m },
                    { 9, 4, "Brócolis", 2m },
                    { 10, 4, "Cerveja", 32m }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Product_ClientId",
                table: "Product",
                column: "ClientId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "Client");
        }
    }
}
