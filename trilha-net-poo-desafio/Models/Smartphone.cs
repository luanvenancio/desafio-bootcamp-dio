namespace DesafioPOO.Models
{
    public abstract class Smartphone : IConectavel
    {
        public string Numero { get; set; }
        public string Modelo { get; private set; }
        public string IMEI { get; private set; }
        public int MemoriaTotal { get; private set; }
        public int MemoriaDisponivel { get; protected set; }

        protected List<Aplicativo> AplicativosInstalados { get; } = new List<Aplicativo>();

        public Smartphone(string numero, string modelo, string imei, int memoria)
        {
            Numero = numero;
            Modelo = modelo;
            IMEI = imei;
            MemoriaTotal = memoria;
            MemoriaDisponivel = memoria;
        }

        public void Ligar()
        {
            Console.WriteLine($"O {Modelo} está ligando...");
        }

        public void ReceberLigacao()
        {
            Console.WriteLine($"Recebendo ligação no número {Numero}...");
        }

        public void ConectarInternet()
        {
            Console.WriteLine($"Conectando o {Modelo} à internet via Wi-Fi...");
        }

        public void ListarAplicativos()
        {
            Console.WriteLine($"\n--- Aplicativos instalados no {Modelo} ---");
            if (!AplicativosInstalados.Any())
            {
                Console.WriteLine("Nenhum aplicativo instalado.");
                return;
            }
            foreach (var app in AplicativosInstalados)
            {
                Console.WriteLine($"- {app.Nome} ({app.TamanhoEmMB} MB)");
            }
        }

        public void ExibirStatus()
        {
            Console.WriteLine($"Status do {Modelo}: Memória Disponível: {MemoriaDisponivel}MB / {MemoriaTotal}MB");
        }

        public virtual void InstalarAplicativo(Aplicativo app)
        {
            if (AplicativosInstalados.Any(instalado => instalado.Nome == app.Nome))
            {
                Console.WriteLine($"AVISO: O aplicativo '{app.Nome}' já está instalado no {Modelo}.");
                return;
            }

            if (MemoriaDisponivel >= app.TamanhoEmMB)
            {
                MemoriaDisponivel -= app.TamanhoEmMB;
                AplicativosInstalados.Add(app);
                Console.WriteLine($"O aplicativo '{app.Nome}' foi instalado com sucesso! Memória restante: {MemoriaDisponivel}MB.");
            }
            else
            {
                Console.WriteLine($"FALHA: Memória insuficiente para instalar '{app.Nome}'. Necessário: {app.TamanhoEmMB}MB, Disponível: {MemoriaDisponivel}MB.");
            }
        }
    }
}