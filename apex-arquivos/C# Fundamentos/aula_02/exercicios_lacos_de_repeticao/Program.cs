using System;

namespace exercicios_lacos_de_repeticao
{
    class Program
    {
        static void Main(string[] args)
        {
            string nomeDoFuncionarioComMaiorPeso = "";
            string nomeDoFuncionarioComMaiorAltura = "";

            double maiorPeso = 0;
            double maiorAltura = 0;

            for (int indice = 1; indice <= 5; indice++)
            {
                Console.WriteLine($"Informe o nome do funcionário {indice}: ");
                string nomeDoFuncionario = Console.ReadLine();

                Console.WriteLine($"Informe o peso do funcionário {indice} em quilogramas: ");
                double pesoDoFuncionario = Convert.ToDouble(Console.ReadLine());

                if (pesoDoFuncionario > maiorPeso)
                {
                    maiorPeso = pesoDoFuncionario;
                }

                Console.WriteLine($"Informe a altura do funcionário {indice} em metros: ");
                double alturaDoFuncionario = Convert.ToDouble(Console.ReadLine());

                if (alturaDoFuncionario > maiorAltura)
                {
                    maiorAltura = alturaDoFuncionario;
                }

                if (maiorPeso == pesoDoFuncionario)
                {
                    nomeDoFuncionarioComMaiorPeso = nomeDoFuncionario;
                }

                if (maiorAltura == alturaDoFuncionario)
                {
                    nomeDoFuncionarioComMaiorAltura = nomeDoFuncionario;
                }
            }

            Console.WriteLine($"Funcionário(a) {nomeDoFuncionarioComMaiorPeso} possui o maior peso: {maiorPeso} kg");
            Console.WriteLine($"Funcionário(a) {nomeDoFuncionarioComMaiorAltura} possui a maior altura: {maiorAltura} m");
        }
    }
}