using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace projetoDB
{
    public class Conexao
    {
        public static SqlConnection ObterConexao()
        {
            string conexao = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DB_AULA_08;Data Source=DESKTOP-BA144B6";

            var sqlCon = new SqlConnection(conexao);

            return sqlCon;
        }
    }
}