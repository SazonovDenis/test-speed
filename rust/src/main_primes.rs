mod primes;

use std::env;
use std::time::SystemTime;


fn main() {
    let args: Vec<String> = env::args().collect();
    let attempts = args[1].parse().unwrap();
    let count: i16 = args[2].parse().unwrap();

    let time_0 = SystemTime::now();
    for _ in 0..attempts {
        primes::print_primes(100_000_000, count);
    }
    let time_1 = SystemTime::now();

    let difference = time_1.duration_since(time_0);
    let duration = difference.ok();
    println!("---");
    println!("Attempts: {}x{}, duration: {duration:?}", attempts, count);
}
