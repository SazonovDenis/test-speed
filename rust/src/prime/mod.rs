use std::time::{Duration, SystemTime};

fn is_prime_number(number: i32) -> bool {
    let mut i: i32 = 2;
    while i < number {
        if number % i == 0 {
            return false;
        }
        i = i + 1;
    }

    return true;
}

pub fn print_primes(from_number: i32) {
    println!("Hello, print_primes!");

    let mut n = from_number;
    loop {
        let time_0 = SystemTime::now();
        let is_prime = is_prime_number(n);
        let time_1 = SystemTime::now();

        if is_prime {
            let difference = time_1.duration_since(time_0);
            let duration = difference.ok();
            println!("{}, {duration:?}", n);
        }

        n = n + 1;
    }
}

