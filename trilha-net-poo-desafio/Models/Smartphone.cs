namespace DesafioPOO.Models
{
    public abstract class Smartphone
    {
        public string Numero { get; set; }
        public string Modelo { get; private set; }
        public string IMEI { get; private set; }
        public int Memoria { get; private set; }

        public Smartphone(string numero, string modelo, string imei, int memoria)
        {
            Numero = numero;
            Modelo = modelo;
            IMEI = imei;
            Memoria = memoria;
        }

        public void Ligar()
        {
            Console.WriteLine($"Ligando o {Modelo}...");
        }

        public void ReceberLigacao()
        {
            Console.WriteLine($"Recebendo ligação no número {Numero}...");
        }

        public abstract void InstalarAplicativo(string nomeApp);
    }
}