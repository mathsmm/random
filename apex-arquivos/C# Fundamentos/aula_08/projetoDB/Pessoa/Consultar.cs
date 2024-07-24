using System.Data.SqlClient;
using System.Text;

namespace projetoDB.Pessoa
{
    public class Consultar
    {
        public string ObterTodos(SqlConnection conexao)
        {
            string selectPessoas = "SELECT * FROM PESSOA";
            SqlCommand comando = new SqlCommand(selectPessoas, conexao); // -> Instancio um comando da classe SqlCommand
            SqlDataReader leitor = comando.ExecuteReader(); // -> Executa o comando definido
            /*
                while (leitor.Read())
                {
                    Console.WriteLine(
                        $"Id: {leitor["ID"]} -"+
                        $"Nome: {leitor["NOME"]} -"+
                        $"CPF: {leitor["CPF"]}"
                    );
                }

                OU:
            */
            StringBuilder sb = new StringBuilder();
            while (leitor.Read()) // -> Lê o que foi executado
            {
                sb.Append("Id: ").Append(leitor["ID"]).Append(" - ")
                  .Append("Nome: ").Append(leitor["NOME"]).Append(" - ")
                  .Append("CPF: ").Append(leitor["CPF"]).Append("\n");
            }
            return sb.ToString();
        }
    }
}