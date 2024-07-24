using projFormPessoa.Modelos;
using projFormPessoa.Servicos.CrudFuncionario;
using projFormPessoa.Utils;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Windows.Forms;

namespace projFormPessoa
{
    public partial class frmPessoa : Form
    {

        const int TAB_LISTA = 0;
        const int TAB_CADASTRO = 1;

        public frmPessoa()
        {
            InitializeComponent();
        }

        // Botões:
        private void btnNovo_Click(object sender, EventArgs e)
        {
            if (tabFuncionario.SelectedIndex == TAB_LISTA)
            {
                TrocarAba(tabPageCadastro);
            }

            LimparCampos();
            ControlarEnableBotoes();
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            Listar();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            SqlConnection conexao = Conexao.ObterConexao();

            try
            {
                conexao.Open();

                Funcionario funcionario = new Funcionario(
                    textNome.Text,
                    mtextCpf.Text.Replace(".", "").Replace("-", ""),
                    dtpDataNasc.Value.ToString("yyyy-MM-dd")
                );

                Incluir incluir = new Incluir();
                incluir.Inserir(conexao, funcionario);

                MessageBox.Show("Cadastro efetuado com sucesso!");

                TrocarAba(tabPageLista);
            }
            catch (Exception erro)
            {
                MessageBox.Show($"Erro ao salvar o funcionário: {erro.Message}");
                throw;
            }
            finally
            {
                conexao.Close();
            }
        }

        private void btnAtualizar_Click(object sender, EventArgs e)
        {
            SqlConnection conexao = Conexao.ObterConexao();

            try
            {
                conexao.Open();

                Funcionario funcionario = new Funcionario(
                    Convert.ToInt32(textId.Text),
                    textNome.Text,
                    mtextCpf.Text.Replace(".", "").Replace("-", ""),
                    dtpDataNasc.Value.ToString("yyyy-MM-dd")
                );

                Atualizar atualizar = new Atualizar();
                atualizar.Update(conexao, funcionario);

                MessageBox.Show("Cadastro atualizado com sucesso!");

                TrocarAba(tabPageLista);
            }
            catch (Exception erro)
            {
                MessageBox.Show($"Erro ao atualizar o funcionário: {erro.Message}");
                throw;
            }
            finally
            {
                conexao.Close();
            }
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            SqlConnection conexao = Conexao.ObterConexao();

            try
            {
                conexao.Open();

                int funcionarioId = Convert.ToInt32(textId.Text);

                Excluir excluir = new Excluir();
                excluir.Delete(conexao, funcionarioId);

                MessageBox.Show("Cadastro excluído com sucesso!");

                LimparCampos();

                TrocarAba(tabPageLista);
            }
            catch (Exception erro)
            {
                MessageBox.Show($"Erro ao excluir o funcionário: \n {erro.Message}");
                throw;
            }
            finally
            {
                conexao.Close();
            }
        }

        // Eventos diversos:
        private void tabFuncionario_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabFuncionario.SelectedIndex == TAB_LISTA)
            {
                Listar();
                LimparCampos();
            }
            else if (tabFuncionario.SelectedIndex == TAB_CADASTRO)
            {
                Selecionar();
            }
            
            ControlarEnableBotoes();
        }

        private void frmPessoa_Load(object sender, EventArgs e)
        {
            Listar();
            ControlarEnableBotoes();
        }

        // Métodos de auxílio:
        private void LimparCampos()
        {
            textId.Clear();
            textNome.Clear();
            mtextCpf.Clear();
            dtpDataNasc.Value =
                DateTime.ParseExact(
                    DateTime.Now.ToString(),
                    "dd/MM/yyyy HH:mm:ss",
                    CultureInfo.InvariantCulture
                );
        }

        private void Listar()
        {
            Listar lista = new Listar();

            if (txbFiltroId.Text.Trim() == "")
            {
                gridFuncionario.DataSource = lista.ObterTodos();
            }
            else
            {
                int id = Convert.ToInt32(txbFiltroId.Text);

                DataTable tabela = lista.ObterPeloId(id);

                gridFuncionario.DataSource = tabela;

                if (tabela.Rows.Count == 0)
                {
                    MessageBox.Show("Funcionário não localizado!");
                }
            }
        }

        private void TrocarAba(TabPage aba)
        {
            tabFuncionario.SelectedTab = aba;
        }

        private void ControlarEnableBotoes()
        {
            btnSalvar.Enabled = (textId.Text.Trim() == "" && tabFuncionario.SelectedIndex == TAB_CADASTRO);
            btnAtualizar.Enabled = textId.Text.Trim() != "";
            btnExcluir.Enabled = textId.Text.Trim() != "";
        }

        private void Selecionar()
        {
            int linha = gridFuncionario.CurrentRow.Index;

            textId.Text = gridFuncionario[0, linha].Value.ToString();
            textNome.Text = gridFuncionario[1, linha].Value.ToString();
            mtextCpf.Text = gridFuncionario[2, linha].Value.ToString();
            dtpDataNasc.Value =
                DateTime.ParseExact(
                    gridFuncionario[3, linha].Value.ToString(),
                    "dd/MM/yyyy HH:mm:ss",
                    CultureInfo.InvariantCulture
                );
        }
    }
}
