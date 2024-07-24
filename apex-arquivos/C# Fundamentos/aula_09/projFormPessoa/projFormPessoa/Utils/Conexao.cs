using System.Data.SqlClient;

namespace projFormPessoa.Utils
{
    class Conexao
    {
        public static SqlConnection ObterConexao()
        {
            string conexao = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DB_FUNCIONARIO;Data Source=DESKTOP-BA144B6";

            SqlConnection sqlConnection = new SqlConnection(conexao);

            return sqlConnection;
        }

    }
}
