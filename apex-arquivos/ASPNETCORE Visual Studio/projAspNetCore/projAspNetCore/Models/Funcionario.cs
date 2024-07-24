using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projAspNetCore.Models
{
    public class Funcionario
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Column(TypeName = "Varchar(70)")]
        [Required]
        public string Nome { get; set; }

        [Column(TypeName = "Varchar(11)")]
        [Required(ErrorMessage = "Informe o CPF")]
        [StringLength(11, ErrorMessage = "O CPF deve conter onze dígitos")]
        public string Cpf { get; set; }
    }
}
