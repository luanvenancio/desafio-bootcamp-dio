namespace DesafioPOO.Models
{
    public class Nokia : Smartphone
    {
        public Nokia(string numero, string modelo, string imei, int memoria) : base(numero, modelo, imei, memoria)
        {
        }

        public override void InstalarAplicativo(Aplicativo app)
        {
            Console.WriteLine($"Buscando '{app.Nome}' na Microsoft Store...");
            base.InstalarAplicativo(app);
        }
    }
}
