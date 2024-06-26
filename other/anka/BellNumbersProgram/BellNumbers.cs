
using System;
using System.Numerics;

namespace BellNumbers {
    public static class Utility {
        public static void Init<T>(this T[] array, T value) {
            if (null == array) return;
            for (int i = 0; i < array.Length; ++i) {
                array[i] = value;
            }
        }
    }

    class Program {
        static BigInteger[][] BellTriangle(int n) {
            BigInteger[][] tri = new BigInteger[n][];
            for (int i = 0; i < n; ++i) {
                tri[i] = new BigInteger[i];
                tri[i].Init(BigInteger.Zero);
            }
            tri[1][0] = 1;
            for (int i = 2; i < n; ++i) {
                tri[i][0] = tri[i - 1][i - 2];
                for (int j = 1; j < i; ++j) {
                    tri[i][j] = tri[i][j - 1] + tri[i - 1][j - 1];
                }
            }
            return tri;
        }

        static void Main(string[] args) {
            var bt = BellTriangle(51);
            int bellMax = 30;
            Console.WriteLine($"First {bellMax} and {bellMax}th Bell numbers:");
            for (int i = 1; i < bellMax+1; ++i) {
                Console.WriteLine("{0,2}: {1}", i, bt[i][0]);
            }
            Console.WriteLine("Only numbers (for an array):");
            for (int i = 1; i < bellMax + 1; ++i)
            {
                Console.Write($" {bt[i][0]} |");
            }
            Console.WriteLine();

            Console.WriteLine("50: {0}", bt[50][0]);
            Console.WriteLine();
            Console.WriteLine("\nThe first ten rows of Bell's triangle, Latex mathematical:");
            for (int i = 1; i < 11; ++i) {
                //Console.WriteLine(bt[i]);
                var it = bt[i].GetEnumerator();
                //Console.Write("[");
                if (it.MoveNext()) {
                    Console.Write(it.Current);
                }
                while (it.MoveNext()) {
                    Console.Write(" & ");  // Console.Write(", ");
                    Console.Write(it.Current);
                }
                Console.WriteLine(@" \\"); // Console.WriteLine("]");
            }
            Console.WriteLine("\nThe first ten rows of Bell's triangle, with brackets:");
            for (int i = 1; i < 11; ++i) {
                //Console.WriteLine(bt[i]);
                var it = bt[i].GetEnumerator();
                Console.Write("[");
                if (it.MoveNext()) {
                    Console.Write(it.Current);
                }
                while (it.MoveNext()) {
                    Console.Write(", ");
                    Console.Write(it.Current);
                }
                Console.WriteLine("]");
            }
        }
    }
}