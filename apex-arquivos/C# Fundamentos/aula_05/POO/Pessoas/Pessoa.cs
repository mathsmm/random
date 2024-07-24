using System;

namespace POO.Pessoas
{

    // public
    // protected
    // private

    public class Pessoa // -> Classe (começa com letra maiúscula)
    {
        public string Nome; // -> Propriedade, atributo da classe
        public DateTime DataNascimento; // (começa com letra maiúscula)
        public char Sexo;

        public string ObterDescricao()
        {
            return $"Nome: {this.Nome} - Data de Nascimento: {this.DataNascimento}";
        }
    }
}