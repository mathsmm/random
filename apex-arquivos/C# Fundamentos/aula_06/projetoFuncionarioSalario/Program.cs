using System;
using projetoFuncionarioSalario.Servicos;

namespace projetoFuncionarioSalario
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Informe o salário: ");
            double salario = Convert.ToDouble(Console.ReadLine());

            Console.Write("Informe a quantidade de faltas: ");
            int qtdeFaltas = Convert.ToInt32(Console.ReadLine());

            CalculoSalarioServico objCalculo = new CalculoSalarioServico(salario, qtdeFaltas);

            string demonstrativo = objCalculo.ObterDemonstrativo();

            Console.WriteLine(demonstrativo);
        }
    }
}
