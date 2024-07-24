namespace ExercicioComplementar.Modelos
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nome { get; set; }

        public Cliente(int id, string nome)
        {
            this.Id = id;
            this.Nome = nome;
        }
    }
}