using projFormPessoa.Modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace projFormPessoa.Servicos.CrudFuncionario
{
    class Atualizar
    {
        public void Update(SqlConnection conexao, Funcionario funcionario)
        {
            string updateFuncionario = $@"UPDATE FUNCIONARIO SET NOME = @nome, CPF = @cpf, DATA_NASCIMENTO = @dataNascimento WHERE ID = @id";

            SqlCommand comando = new SqlCommand(updateFuncionario, conexao);

            comando.Parameters.AddWithValue("@id", funcionario.Id);
            comando.Parameters.AddWithValue("@nome", funcionario.Nome);
            comando.Parameters.AddWithValue("@cpf", funcionario.Cpf);
            comando.Parameters.AddWithValue("@dataNascimento", funcionario.DataNascimento);

            comando.ExecuteNonQuery();
        }
    }
}
