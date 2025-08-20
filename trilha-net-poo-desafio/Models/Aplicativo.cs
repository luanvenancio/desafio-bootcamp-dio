namespace DesafioPOO.Models
{
    public class Aplicativo
    {
        public string Nome { get; }
        public int TamanhoEmMB { get; }

        public Aplicativo(string nome, int tamanhoEmMB)
        {
            Nome = nome;
            TamanhoEmMB = tamanhoEmMB;
        }
    }
}