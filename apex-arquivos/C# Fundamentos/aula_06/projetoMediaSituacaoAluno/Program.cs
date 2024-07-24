using System;
using projetoMediaSituacaoAluno.Alunos;

namespace projetoMediaSituacaoAluno
{
    class Program
    {
        static void Main(string[] args)
        {
            Aluno objAluno = new Aluno(
                "Matheus",
                6,
                7
            );

            Console.WriteLine(objAluno.ObterMensagemDeMediaESituacao());
        }
    }
}
