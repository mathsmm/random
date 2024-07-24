using System.Data.SqlClient;

namespace projetoDB.Pessoa
{
    public class Inserir
    {
        public void Insere(SqlConnection conexao, PessoaModelo pessoa)
        {
            string insertPessoa = @"INSERT INTO PESSOA(NOME, CPF) VALUES(@nome, @cpf)";
            // @""   /   @parametro1, @parametro2   / -> String terá parâmetros

            SqlCommand comando = new SqlCommand(insertPessoa, conexao);
            comando.Parameters.AddWithValue("@nome", pessoa.Nome);
            comando.Parameters.AddWithValue("@cpf", pessoa.Cpf);

            comando.ExecuteNonQuery(); // --> Executa como se fosse o F5 que se dá no SQL
        }
    }
}