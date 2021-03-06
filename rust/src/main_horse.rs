mod horse;

use std::env;
use std::time::SystemTime;


fn main() {
    let args: Vec<String> = env::args().collect();
    let attempts = args[1].parse().unwrap();
    let size_x: i16 = args[2].parse().unwrap();
    let size_y: i16 = args[3].parse().unwrap();

    let time_0 = SystemTime::now();
    for _ in 0..attempts {
        horse::calc_horse(size_x, size_y, 0, 0);
        println!();
    }
    let time_1 = SystemTime::now();

    let difference = time_1.duration_since(time_0);
    let duration = difference.ok();
    println!("---");
    println!("Attempts: {}, duration: {duration:?}", attempts);
}
