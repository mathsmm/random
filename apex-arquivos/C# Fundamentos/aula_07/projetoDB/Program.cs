using System;
using System.Data.SqlClient;

namespace projetoDB
{
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection conexao = Conexao.ObterConexao();

            // Tratativa de erro:
            try
            {
                conexao.Open();
                Console.WriteLine("Conexão estabelecida com sucesso!");
            }
            catch (Exception erro)
            {
                Console.WriteLine($"Ocorreu erro ao tentar efetuar a conexão: {erro.Message}");
            }
            finally
            {
                conexao.Close();
            }
        }
    }
}
