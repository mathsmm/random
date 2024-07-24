using projFormPessoa.Modelos;
using System.Data.SqlClient;

namespace projFormPessoa.Servicos.CrudFuncionario
{
    class Incluir
    {
        public void Inserir(SqlConnection conexao, Funcionario funcionario)
        {
            string insertFuncionario = @"INSERT INTO FUNCIONARIO(NOME, CPF, DATA_NASCIMENTO) VALUES(@nome, @cpf, @data_nascimento)";

            SqlCommand comando = new SqlCommand(insertFuncionario, conexao);
            comando.Parameters.AddWithValue("@nome", funcionario.Nome);
            comando.Parameters.AddWithValue("@cpf", funcionario.Cpf);
            comando.Parameters.AddWithValue("@data_nascimento", funcionario.DataNascimento);

            comando.ExecuteNonQuery();
        }
    }
}
