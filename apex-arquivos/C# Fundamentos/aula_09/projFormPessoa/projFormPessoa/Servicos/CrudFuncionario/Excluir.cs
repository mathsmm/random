using System.Data.SqlClient;

namespace projFormPessoa.Servicos.CrudFuncionario
{
    class Excluir
    {
        public void Delete(SqlConnection conexao, int funcionarioId)
        {
            string deleteFuncionario = @"DELETE FROM FUNCIONARIO WHERE ID = @id";

            SqlCommand comando = new SqlCommand(deleteFuncionario, conexao);
            comando.Parameters.AddWithValue("@id", funcionarioId);
            comando.ExecuteNonQuery();
        }
    }
}
