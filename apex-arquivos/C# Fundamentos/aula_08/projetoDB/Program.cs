using System;
using System.Data.SqlClient;
using projetoDB.Pessoa;

namespace projetoDB
{
    class Program
    {
        static void Main(string[] args)
        {
            var conexao = Conexao.ObterConexao();

            // Tratativa de erro:
            try // -> "tente:"; se der certo, execute isto:
            {
                conexao.Open(); // -> Abre a conexão
                Console.WriteLine("Conexão estabelecida com sucesso!");

                PessoaModelo pessoaQueQueroInserir = new PessoaModelo(0, "Maria", "11111111119");
                // Pode ser instanciado qualquer id neste caso
                Inserir inserir = new Inserir();
                inserir.Insere(conexao, pessoaQueQueroInserir);

                PessoaModelo pessoaQueQueroAtualizar = new PessoaModelo(7, "Wellington", "11111111122");
                Atualizar atualizar = new Atualizar();
                atualizar.Atualiza(conexao, pessoaQueQueroAtualizar);

                Excluir excluir = new Excluir();
                excluir.Exclui(conexao, 8);

                Consultar consulta = new Consultar();
                Console.Write(consulta.ObterTodos(conexao));
            }
            catch (Exception erro) // -> se não der certo, faça isto:
            {
                Console.WriteLine($"Erro ao obter conexão: {erro.Message}");
            }
            finally
            {
                conexao.Close(); // -> Fecha a conexão
            }

            Console.WriteLine()
        }
    }
}
