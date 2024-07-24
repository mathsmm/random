using System.Data.SqlClient;

namespace projetoDB.Pessoa
{
    public class Excluir
    {
        public void Exclui(SqlConnection conexao, int id)
        {
            string deletePessoa = $@"DELETE FROM PESSOA WHERE ID = {id}";
            SqlCommand comando = new SqlCommand(deletePessoa, conexao);

            comando.ExecuteNonQuery();
        }
    }
}