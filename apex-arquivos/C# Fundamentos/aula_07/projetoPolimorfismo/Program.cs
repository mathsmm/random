using System;

namespace projetoPolimorfismo
{
    class Program
    {
        static void Main(string[] args)
        {
            Atendente objAtendente = new Atendente(1000);
            string salarioAtendente = objAtendente.ObterSalario();
            Console.WriteLine(salarioAtendente);

            Console.WriteLine("=========================");

            Gerente objGerente = new Gerente(1000);
            string salarioGerente = objGerente.ObterSalario();
            Console.WriteLine(salarioGerente);
        }
    }
}
