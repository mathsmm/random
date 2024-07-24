using System.Data.SqlClient;

namespace projetoDB.Pessoa
{
    public class Atualizar
    {
        public void  Atualiza(SqlConnection conexao, PessoaModelo pessoa)
        {
            string updatePessoa = @"UPDATE PESSOA SET NOME = @nome, CPF = @cpf WHERE ID = @id";
            SqlCommand comando = new SqlCommand(updatePessoa, conexao);
            comando.Parameters.AddWithValue("@nome", pessoa.Nome);
            comando.Parameters.AddWithValue("@cpf", pessoa.Cpf);
            comando.Parameters.AddWithValue("@id", pessoa.Id);

            comando.ExecuteNonQuery();
        }
    }
}