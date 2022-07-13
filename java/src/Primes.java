import java.util.*;

public class Primes {

    public static void main(String[] args) {
        print_primes(100_000_000);
    }

    public static void print_primes(int start_from) {
        System.out.println("Hello, print_primes!");

        int n = start_from;
        while (true) {
            Date time_0 = new Date();
            boolean is_prime = is_prime_number(n);
            Date time_1 = new Date();

            if (is_prime) {
                long duration = (time_1.getTime() - time_0.getTime());
                System.out.println(n + ", " + duration + " msec");
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
