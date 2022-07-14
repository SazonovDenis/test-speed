import java.util.*;

public class Primes {

    public static void main(String[] args) {
        int attempts = Integer.parseInt(args[0]);
        int count = Integer.parseInt(args[1]);

        Date time_0 = new Date();
        for (int attempt = 0; attempt < attempts; attempt++) {
            print_primes(100_000_000, count);
        }
        Date time_1 = new Date();

        double duration = (time_1.getTime() - time_0.getTime()) / 1000.0;
        System.out.println("---");
        System.out.println(String.format("Attempts: %s, duration: %s sec", attempts, duration));
    }

    public static void print_primes(int start_from, int count) {
        System.out.println("Hello, print_primes!");

        int n = start_from;
        while (count > 0) {
            Date time_0 = new Date();
            boolean is_prime = is_prime_number(n);
            Date time_1 = new Date();

            if (is_prime) {
                long duration = (time_1.getTime() - time_0.getTime());
                System.out.println(n + ", " + duration + " msec");
                count = count - 1;
            }

            n = n + 1;
        }
    }

    public static boolean is_prime_number(int number) {
        int i = 2;
        while (i < number) {
            if (number % i == 0) {
                return false;
            }
            i = i + 1;
        }

        return true;
    }

}
