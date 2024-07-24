using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace APIClienteProduto.Models
{
    public class Client
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Column(TypeName = "VARCHAR(70)")]
        [Required]
        public string Name { get; set; }

        [Column(TypeName = "VARCHAR(11)")]
        [Required(ErrorMessage = "Informe o CPF")]
        [StringLength(11, ErrorMessage = "O CPF deve conter 11 dígitos!")]
        public string Cpf { get; set; }

        public IEnumerable<Product> Products { get; set; }

        public Client(int id, string name, string cpf)
        {
            this.Id = id;
            this.Name = name;
            this.Cpf = cpf;
        }
    }
}