namespace projetoMediaSituacaoAluno.Alunos
{
    public class Aluno
    {
        private string Nome { get; set; }
        private double Nota1 { get; set; }
        private double Nota2 { get; set; }

        public Aluno(string nome, double nota1, double nota2)
        {
            this.Nome = nome;
            this.Nota1 = nota1;
            this.Nota2 = nota2;
        }

        private double CalcularMedia()
        {
            return (this.Nota1 + this.Nota2) / 2;
        }

        private string ObterSituacao(double mediaDasNotas)
        {
            // if (mediaDasNotas >= 7)
            // {
            //     return "Aprovado";
            // }
            // return "Reprovado";

            return mediaDasNotas >= 7 ? "Aprovado" : "Reprovado";
        }

        public string ObterMensagemDeMediaESituacao()
        {
            double media = CalcularMedia();
            string situacao = ObterSituacao(media);

            return $"O aluno {this.Nome} obteve média {media} e sua situação é: {situacao}";
        }
    }
}