namespace DesafioPOO.Models
{
    public class Iphone : Smartphone
    {
        public Iphone(string numero, string modelo, string imei, int memoria) : base(numero, modelo, imei, memoria)
        {
        }

        public override void InstalarAplicativo(Aplicativo app)
        {
            Console.WriteLine($"Verificando '{app.Nome}' na App Store...");
            base.InstalarAplicativo(app);
        }
    }
}