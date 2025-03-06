public class sample {

    private static long catalan(int n) {
        long[] cat = new long[n+1];
        cat[0] = 1;
        for (int i = 1; i <= n; i++) {
            for (int j = 0; j < i; j++) {
                cat[i] += cat[j] * cat[i-j-1];
            }
        }
        return cat[n];
    }

    public static void main(String[] args) {
        final int N = 30; 
        long start = System.nanoTime();
        for (int i = 0; i < N; i++) {
            System.out.println("C(" + i + ") = " + catalan(i));
        }
        long end = System.nanoTime();
        double elapsedMs = (end - start) / 1_000_000.0;
        System.out.printf("Tiempo de ejecución (en Java): %.2f ms%n", elapsedMs);
    }
}