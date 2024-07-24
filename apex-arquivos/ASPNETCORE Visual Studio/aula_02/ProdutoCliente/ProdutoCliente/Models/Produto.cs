using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ProdutoCliente.Models
{
    public class Produto
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Column(TypeName = "Varchar(100)")]
        [Required]
        public string Descricao { get; set; }

        [ForeignKey("Cliente")]
        [Display(Name = "Cliente")]
        public int ClienteId { get; set; }

        public Cliente Cliente { get; set; }
    }
}
