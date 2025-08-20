public class Program
{
    static void Main(string[] args)
    {
        Smartphone nokia = new Nokia(numero: "11987654321", modelo: "Nokia G21", imei: "IMEI123456789", memoria: 64);
        Smartphone iphone = new Iphone(numero: "21912345678", modelo: "iPhone 15", imei: "IMEI987654321", memoria: 128 * 1024);

        List<Aplicativo> lojaDeApps = new List<Aplicativo>
        {
            new Aplicativo("WhatsApp", 80),
            new Aplicativo("Instagram", 120),
            new Aplicativo("iFood", 60),
            new Aplicativo("Uber", 75)
        };

        SimularUso(nokia, lojaDeApps);
        SimularUso(iphone, lojaDeApps);
    }

    public static void SimularUso(Smartphone celular, List<Aplicativo> loja)
    {
        Console.WriteLine($"\n======= Iniciando simulação com o {celular.Modelo} =======");

        celular.Ligar();
        celular.ExibirStatus();
        celular.ConectarInternet();

        celular.InstalarAplicativo(loja[0]);
        celular.InstalarAplicativo(loja[1]);
        celular.InstalarAplicativo(loja[0]);

        celular.ReceberLigacao();
        celular.ListarAplicativos();
        celular.ExibirStatus();

        Console.WriteLine($"======= Fim da simulação com o {celular.Modelo} =======");
    }
}
