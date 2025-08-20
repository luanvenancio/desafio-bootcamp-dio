using DesafioPOO.Models;

class Program
{
    static void Main()
    {
        //Teste Iphone
        Smartphone iphone14 = new Iphone("11998765432", "Iphone 14", "IMEI12345", 128);
        iphone14.Ligar();
        iphone14.InstalarAplicativo("Youtube");

        // Teste Nokia
        Smartphone nokia = new Nokia("21912345678", "Nokia 3310", "IMEI243546", 16);
        nokia.Ligar();
        nokia.ReceberLigacao();
        nokia.InstalarAplicativo("Whatsapp");
    }
}