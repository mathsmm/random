using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace APIClienteProduto.Models
{
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Column(TypeName = "VARCHAR(100)")]
        [Required]
        public string Description { get; set; }

        [Required]
        public decimal Value { get; set; }

        [ForeignKey("Client")]
        public int ClientId { get; set; }

        public Client Client { get; set; }

        public Product(int id, string description, decimal value, int clientId)
        {
            this.Id = id;
            this.Description = description;
            this.Value = value;
            this.ClientId = clientId;
        }
    }
}