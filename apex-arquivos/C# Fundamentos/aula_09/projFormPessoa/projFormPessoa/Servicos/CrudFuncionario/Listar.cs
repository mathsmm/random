using projFormPessoa.Utils;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace projFormPessoa.Servicos.CrudFuncionario
{
    class Listar
    {
        public DataTable ObterTodos()
        {
            DataTable tabelaFuncionario = new DataTable();
            SqlConnection conexao = Conexao.ObterConexao();

            try
            {
                conexao.Open();
                string selectFuncionarios = "SELECT * FROM FUNCIONARIO";
                SqlCommand comando = new SqlCommand(selectFuncionarios, conexao);
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = comando;
                adaptador.Fill(tabelaFuncionario);
            }
            catch (Exception erro)
            {
                MessageBox.Show($"Ao obter todos os funcionários ocorreu o erro:\n {erro.Message}");
                throw;
            }
            finally
            {
                conexao.Close();
            }

            return tabelaFuncionario;
        }

        public DataTable ObterPeloId(int id)
        {
            DataTable tabelaFuncionario = new DataTable();
            SqlConnection conexao = Conexao.ObterConexao();

            try
            {
                conexao.Open();
                string selectFuncionarios = $@"SELECT * FROM FUNCIONARIO WHERE ID = {id}";
                SqlCommand comando = new SqlCommand(selectFuncionarios, conexao);
                SqlDataAdapter adaptador = new SqlDataAdapter();
                adaptador.SelectCommand = comando;
                adaptador.Fill(tabelaFuncionario);
            }
            catch (Exception erro)
            {
                MessageBox.Show($"Ao obter o funcionário pelo ID ocorreu o erro:\n {erro.Message}");
                throw;
            }
            finally
            {
                conexao.Close();
            }

            return tabelaFuncionario;
        }
    }
}
