using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProdutoCliente.Models
{
    public class Cliente
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
      
        [Column(TypeName = "Varchar(70)")]
        [Required]
        public string Nome { get; set; }

        [Column(TypeName = "Varchar(11)")]
        [Required(ErrorMessage = "Informe o CPF")]
        [StringLength(11, ErrorMessage = "O CPF deve conter onze caracteres")]
        public string Cpf { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime DataNascimento { get; set; }

        public IEnumerable<Produto> Produtos { get; set; }
    }
}
