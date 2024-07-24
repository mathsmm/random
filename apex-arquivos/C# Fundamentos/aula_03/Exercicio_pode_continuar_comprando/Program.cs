using System;

namespace Exercicio_pode_continuar_comprando
{
    class Program
    {
        static void Main(string[] args)
        {
            double valorDisponivel = 0;
            double valorCompra = 0;
            double somaDasCompras = 0;
            bool podeContinuarComprando = true;

            Console.WriteLine("Informe o valor disponível para comprar: ");
            valorDisponivel = Convert.ToDouble(Console.ReadLine());

            while (podeContinuarComprando)
            {
                Console.WriteLine("Informe o valor da compra: ");
                valorCompra = Convert.ToDouble(Console.ReadLine());

                if (valorCompra > 0)
                {
                    if (valorCompra <= valorDisponivel)
                    {
                        valorDisponivel -= valorCompra;
                        somaDasCompras += valorCompra;
                        Console.WriteLine($"Compra aceita! Saldo disponivel: {valorDisponivel}");
                    }
                    else
                    {
                        podeContinuarComprando = false;
                        Console.WriteLine("Fim das compras. Saldo indisponível.");
                    }
                }
                else
                {
                    Console.WriteLine("Informe um valor maior que zero.");
                }
            }
            Console.WriteLine($"Soma total das compras: {somaDasCompras}");
            Console.WriteLine($"Saldo restante: {valorDisponivel}");
        }
    }
}