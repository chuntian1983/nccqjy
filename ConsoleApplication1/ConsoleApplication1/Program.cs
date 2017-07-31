using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            Thread t = new Thread(cc);
            t.Start();
            cc();
        }
        static void cc()
        {
            Console.WriteLine("22");
        }
    }
}
