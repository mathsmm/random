namespace projFormPessoa
{
    partial class frmPessoa
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmPessoa));
            this.pnlTopo = new System.Windows.Forms.Panel();
            this.btnNovo = new System.Windows.Forms.Button();
            this.btnAtualizar = new System.Windows.Forms.Button();
            this.lblTopo = new System.Windows.Forms.Label();
            this.btnExcluir = new System.Windows.Forms.Button();
            this.btnSalvar = new System.Windows.Forms.Button();
            this.tabFuncionario = new System.Windows.Forms.TabControl();
            this.tabPageLista = new System.Windows.Forms.TabPage();
            this.pnlListaTabela = new System.Windows.Forms.Panel();
            this.gridFuncionario = new System.Windows.Forms.DataGridView();
            this.pnlListaFiltro = new System.Windows.Forms.Panel();
            this.btnFiltrar = new System.Windows.Forms.Button();
            this.txbFiltroId = new System.Windows.Forms.TextBox();
            this.lblId = new System.Windows.Forms.Label();
            this.tabPageCadastro = new System.Windows.Forms.TabPage();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.dtpDataNasc = new System.Windows.Forms.DateTimePicker();
            this.mtextCpf = new System.Windows.Forms.MaskedTextBox();
            this.textNome = new System.Windows.Forms.TextBox();
            this.textId = new System.Windows.Forms.TextBox();
            this.lblDataNasc = new System.Windows.Forms.Label();
            this.lblCpf = new System.Windows.Forms.Label();
            this.lblNome = new System.Windows.Forms.Label();
            this.lblCadastroId = new System.Windows.Forms.Label();
            this.pnlTopo.SuspendLayout();
            this.tabFuncionario.SuspendLayout();
            this.tabPageLista.SuspendLayout();
            this.pnlListaTabela.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gridFuncionario)).BeginInit();
            this.pnlListaFiltro.SuspendLayout();
            this.tabPageCadastro.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlTopo
            // 
            this.pnlTopo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnlTopo.Controls.Add(this.btnNovo);
            this.pnlTopo.Controls.Add(this.btnAtualizar);
            this.pnlTopo.Controls.Add(this.lblTopo);
            this.pnlTopo.Controls.Add(this.btnExcluir);
            this.pnlTopo.Controls.Add(this.btnSalvar);
            this.pnlTopo.Location = new System.Drawing.Point(12, 12);
            this.pnlTopo.Margin = new System.Windows.Forms.Padding(1);
            this.pnlTopo.Name = "pnlTopo";
            this.pnlTopo.Size = new System.Drawing.Size(776, 45);
            this.pnlTopo.TabIndex = 0;
            // 
            // btnNovo
            // 
            this.btnNovo.Image = ((System.Drawing.Image)(resources.GetObject("btnNovo.Image")));
            this.btnNovo.Location = new System.Drawing.Point(7, 3);
            this.btnNovo.Name = "btnNovo";
            this.btnNovo.Size = new System.Drawing.Size(40, 40);
            this.btnNovo.TabIndex = 9;
            this.btnNovo.UseVisualStyleBackColor = true;
            this.btnNovo.Click += new System.EventHandler(this.btnNovo_Click);
            // 
            // btnAtualizar
            // 
            this.btnAtualizar.Image = ((System.Drawing.Image)(resources.GetObject("btnAtualizar.Image")));
            this.btnAtualizar.Location = new System.Drawing.Point(99, 3);
            this.btnAtualizar.Name = "btnAtualizar";
            this.btnAtualizar.Size = new System.Drawing.Size(40, 40);
            this.btnAtualizar.TabIndex = 2;
            this.btnAtualizar.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnAtualizar.UseVisualStyleBackColor = true;
            this.btnAtualizar.Click += new System.EventHandler(this.btnAtualizar_Click);
            // 
            // lblTopo
            // 
            this.lblTopo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTopo.AutoSize = true;
            this.lblTopo.Font = new System.Drawing.Font("Segoe UI", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lblTopo.Location = new System.Drawing.Point(469, 0);
            this.lblTopo.Name = "lblTopo";
            this.lblTopo.Size = new System.Drawing.Size(306, 37);
            this.lblTopo.TabIndex = 0;
            this.lblTopo.Text = "Cadastro de Funcionário";
            // 
            // btnExcluir
            // 
            this.btnExcluir.Image = ((System.Drawing.Image)(resources.GetObject("btnExcluir.Image")));
            this.btnExcluir.Location = new System.Drawing.Point(145, 3);
            this.btnExcluir.Name = "btnExcluir";
            this.btnExcluir.Size = new System.Drawing.Size(40, 40);
            this.btnExcluir.TabIndex = 1;
            this.btnExcluir.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnExcluir.UseVisualStyleBackColor = true;
            this.btnExcluir.Click += new System.EventHandler(this.btnExcluir_Click);
            // 
            // btnSalvar
            // 
            this.btnSalvar.Image = ((System.Drawing.Image)(resources.GetObject("btnSalvar.Image")));
            this.btnSalvar.Location = new System.Drawing.Point(53, 3);
            this.btnSalvar.Name = "btnSalvar";
            this.btnSalvar.Size = new System.Drawing.Size(40, 40);
            this.btnSalvar.TabIndex = 0;
            this.btnSalvar.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnSalvar.UseVisualStyleBackColor = true;
            this.btnSalvar.Click += new System.EventHandler(this.btnSalvar_Click);
            // 
            // tabFuncionario
            // 
            this.tabFuncionario.Controls.Add(this.tabPageLista);
            this.tabFuncionario.Controls.Add(this.tabPageCadastro);
            this.tabFuncionario.Location = new System.Drawing.Point(12, 61);
            this.tabFuncionario.Name = "tabFuncionario";
            this.tabFuncionario.SelectedIndex = 0;
            this.tabFuncionario.Size = new System.Drawing.Size(775, 377);
            this.tabFuncionario.TabIndex = 1;
            this.tabFuncionario.Tag = "";
            this.tabFuncionario.SelectedIndexChanged += new System.EventHandler(this.tabFuncionario_SelectedIndexChanged);
            // 
            // tabPageLista
            // 
            this.tabPageLista.Controls.Add(this.pnlListaTabela);
            this.tabPageLista.Controls.Add(this.pnlListaFiltro);
            this.tabPageLista.Location = new System.Drawing.Point(4, 24);
            this.tabPageLista.Name = "tabPageLista";
            this.tabPageLista.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageLista.Size = new System.Drawing.Size(767, 349);
            this.tabPageLista.TabIndex = 0;
            this.tabPageLista.Text = "Lista";
            this.tabPageLista.UseVisualStyleBackColor = true;
            // 
            // pnlListaTabela
            // 
            this.pnlListaTabela.Controls.Add(this.gridFuncionario);
            this.pnlListaTabela.Location = new System.Drawing.Point(3, 57);
            this.pnlListaTabela.Name = "pnlListaTabela";
            this.pnlListaTabela.Size = new System.Drawing.Size(761, 277);
            this.pnlListaTabela.TabIndex = 1;
            // 
            // gridFuncionario
            // 
            this.gridFuncionario.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridFuncionario.Location = new System.Drawing.Point(0, 0);
            this.gridFuncionario.Name = "gridFuncionario";
            this.gridFuncionario.Size = new System.Drawing.Size(761, 277);
            this.gridFuncionario.TabIndex = 0;
            this.gridFuncionario.Text = "dataGridView1";
            // 
            // pnlListaFiltro
            // 
            this.pnlListaFiltro.Controls.Add(this.btnFiltrar);
            this.pnlListaFiltro.Controls.Add(this.txbFiltroId);
            this.pnlListaFiltro.Controls.Add(this.lblId);
            this.pnlListaFiltro.Location = new System.Drawing.Point(3, 3);
            this.pnlListaFiltro.Name = "pnlListaFiltro";
            this.pnlListaFiltro.Size = new System.Drawing.Size(761, 48);
            this.pnlListaFiltro.TabIndex = 0;
            // 
            // btnFiltrar
            // 
            this.btnFiltrar.Location = new System.Drawing.Point(331, 10);
            this.btnFiltrar.Name = "btnFiltrar";
            this.btnFiltrar.Size = new System.Drawing.Size(95, 24);
            this.btnFiltrar.TabIndex = 2;
            this.btnFiltrar.Text = "Filtrar";
            this.btnFiltrar.UseVisualStyleBackColor = true;
            this.btnFiltrar.Click += new System.EventHandler(this.btnFiltrar_Click);
            // 
            // txbFiltroId
            // 
            this.txbFiltroId.Location = new System.Drawing.Point(38, 10);
            this.txbFiltroId.Name = "txbFiltroId";
            this.txbFiltroId.Size = new System.Drawing.Size(287, 23);
            this.txbFiltroId.TabIndex = 1;
            // 
            // lblId
            // 
            this.lblId.AutoSize = true;
            this.lblId.Location = new System.Drawing.Point(14, 13);
            this.lblId.Name = "lblId";
            this.lblId.Size = new System.Drawing.Size(18, 15);
            this.lblId.TabIndex = 0;
            this.lblId.Text = "ID";
            // 
            // tabPageCadastro
            // 
            this.tabPageCadastro.Controls.Add(this.panel2);
            this.tabPageCadastro.Controls.Add(this.panel1);
            this.tabPageCadastro.Location = new System.Drawing.Point(4, 24);
            this.tabPageCadastro.Name = "tabPageCadastro";
            this.tabPageCadastro.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageCadastro.Size = new System.Drawing.Size(767, 349);
            this.tabPageCadastro.TabIndex = 1;
            this.tabPageCadastro.Text = "Cadastro";
            this.tabPageCadastro.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.Location = new System.Drawing.Point(578, 3);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(186, 331);
            this.panel2.TabIndex = 1;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.dtpDataNasc);
            this.panel1.Controls.Add(this.mtextCpf);
            this.panel1.Controls.Add(this.textNome);
            this.panel1.Controls.Add(this.textId);
            this.panel1.Controls.Add(this.lblDataNasc);
            this.panel1.Controls.Add(this.lblCpf);
            this.panel1.Controls.Add(this.lblNome);
            this.panel1.Controls.Add(this.lblCadastroId);
            this.panel1.Location = new System.Drawing.Point(3, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(569, 331);
            this.panel1.TabIndex = 0;
            // 
            // dtpDataNasc
            // 
            this.dtpDataNasc.Location = new System.Drawing.Point(85, 165);
            this.dtpDataNasc.Name = "dtpDataNasc";
            this.dtpDataNasc.Size = new System.Drawing.Size(238, 23);
            this.dtpDataNasc.TabIndex = 8;
            // 
            // mtextCpf
            // 
            this.mtextCpf.Location = new System.Drawing.Point(85, 114);
            this.mtextCpf.Mask = "999,999,999-99";
            this.mtextCpf.Name = "mtextCpf";
            this.mtextCpf.Size = new System.Drawing.Size(238, 23);
            this.mtextCpf.TabIndex = 7;
            // 
            // textNome
            // 
            this.textNome.Location = new System.Drawing.Point(85, 65);
            this.textNome.Name = "textNome";
            this.textNome.Size = new System.Drawing.Size(450, 23);
            this.textNome.TabIndex = 5;
            // 
            // textId
            // 
            this.textId.Enabled = false;
            this.textId.Location = new System.Drawing.Point(85, 21);
            this.textId.Name = "textId";
            this.textId.Size = new System.Drawing.Size(238, 23);
            this.textId.TabIndex = 4;
            // 
            // lblDataNasc
            // 
            this.lblDataNasc.AutoSize = true;
            this.lblDataNasc.Location = new System.Drawing.Point(13, 171);
            this.lblDataNasc.Name = "lblDataNasc";
            this.lblDataNasc.Size = new System.Drawing.Size(66, 15);
            this.lblDataNasc.TabIndex = 3;
            this.lblDataNasc.Text = "Data Nasc.:";
            // 
            // lblCpf
            // 
            this.lblCpf.AutoSize = true;
            this.lblCpf.Location = new System.Drawing.Point(48, 117);
            this.lblCpf.Name = "lblCpf";
            this.lblCpf.Size = new System.Drawing.Size(31, 15);
            this.lblCpf.TabIndex = 2;
            this.lblCpf.Text = "CPF:";
            // 
            // lblNome
            // 
            this.lblNome.AutoSize = true;
            this.lblNome.Location = new System.Drawing.Point(36, 68);
            this.lblNome.Name = "lblNome";
            this.lblNome.Size = new System.Drawing.Size(43, 15);
            this.lblNome.TabIndex = 1;
            this.lblNome.Text = "Nome:";
            // 
            // lblCadastroId
            // 
            this.lblCadastroId.AutoSize = true;
            this.lblCadastroId.Location = new System.Drawing.Point(58, 24);
            this.lblCadastroId.Name = "lblCadastroId";
            this.lblCadastroId.Size = new System.Drawing.Size(21, 15);
            this.lblCadastroId.TabIndex = 0;
            this.lblCadastroId.Text = "ID:";
            // 
            // frmPessoa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tabFuncionario);
            this.Controls.Add(this.pnlTopo);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "frmPessoa";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Formulário PESSOA >>>";
            this.Load += new System.EventHandler(this.frmPessoa_Load);
            this.pnlTopo.ResumeLayout(false);
            this.pnlTopo.PerformLayout();
            this.tabFuncionario.ResumeLayout(false);
            this.tabPageLista.ResumeLayout(false);
            this.pnlListaTabela.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gridFuncionario)).EndInit();
            this.pnlListaFiltro.ResumeLayout(false);
            this.pnlListaFiltro.PerformLayout();
            this.tabPageCadastro.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlTopo;
        private System.Windows.Forms.Label lblTopo;
        private System.Windows.Forms.TabControl tabFuncionario;
        private System.Windows.Forms.TabPage tabPageLista;
        private System.Windows.Forms.Panel pnlListaTabela;
        private System.Windows.Forms.Panel pnlListaFiltro;
        private System.Windows.Forms.Button btnFiltrar;
        private System.Windows.Forms.TextBox txbFiltroId;
        private System.Windows.Forms.Label lblId;
        private System.Windows.Forms.TabPage tabPageCadastro;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button btnAtualizar;
        private System.Windows.Forms.Button btnExcluir;
        private System.Windows.Forms.Button btnSalvar;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DateTimePicker dtpDataNasc;
        private System.Windows.Forms.MaskedTextBox mtextCpf;
        private System.Windows.Forms.TextBox textNome;
        private System.Windows.Forms.TextBox textId;
        private System.Windows.Forms.Label lblDataNasc;
        private System.Windows.Forms.Label lblCpf;
        private System.Windows.Forms.Label lblNome;
        private System.Windows.Forms.Label lblCadastroId;
        private System.Windows.Forms.DataGridView gridFuncionario;
        private System.Windows.Forms.Button btnNovo;
    }
}

