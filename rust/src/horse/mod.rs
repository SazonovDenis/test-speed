use std::time::{Duration, SystemTime};

struct State {
    path_count_total: u32,
    path_count_ok: u32,
}

pub fn calc_horse(x0: usize, y0: usize, size_x: usize, size_y: usize) {
    println!("Hello, horse, board {}x{}", size_x, size_y);

    let mut grid = vec![vec![0; size_x]; size_y];

    let mut state = State { path_count_total: 0, path_count_ok: 0 };

    let time_0 = SystemTime::now();
    step_horce(1, &mut state, x0, y0, &mut grid);
    let time_1 = SystemTime::now();

    println!("Board {}x{}, full path count: {}, total path count: {}", size_x, size_y, state.path_count_ok, state.path_count_total);

    let difference = time_1.duration_since(time_0);
    let duration = difference.ok();
    println!("duration: {duration:?}");
}

fn step_horce(step_no: u16, state: &mut State, x0: usize, y0: usize, position: &mut Vec<Vec<u16>>) {
    // ---------------------
    // Make my step
    position[y0][x0] = step_no;

    // ---------------------
    // Print board after my step
    // print_board(step_no, state, position);
    // println!();

    // ---------------------
    // Try to do next 8 step
    let size_y = position.len();
    let size_x = position[0].len();
    let board_size = size_x as u16 * size_y as u16;

    let step_diffs: [(i16, i16); 8] = [(1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1), (-2, -1), (-1, -2)];

    let mut steps_done = 0;
    for step_diff in step_diffs {
        let x1 = (x0 as i16 + step_diff.0) as usize;
        let y1 = (y0 as i16 + step_diff.1) as usize;

        if x1 < 0 || x1 >= size_x {
            continue;
        }
        if y1 < 0 || y1 >= size_y {
            continue;
        }
        if position[y1][x1] != 0 {
            continue;
        }

        step_horce(step_no + 1, state, x1, y1, position);

        steps_done = steps_done + 1;
    }

    // ---------------------
    // Whe nave no more steps?
    if steps_done == 0 {
        state.path_count_total = state.path_count_total + 1;
    }

    if steps_done == 0 && step_no == board_size {
        state.path_count_ok = state.path_count_ok + 1;
        println!("Full path count: {}/{}", state.path_count_ok, state.path_count_total);
        print_board(step_no, state, position);
        println!();
    }

    if steps_done == 0 && step_no != board_size {
        //println!("Steps faled");
        //print_board(step_no, state.total_paths_done, position);
        //println!("---------------------");
    }

    // ---------------------
    // Make my step back
    position[y0][x0] = 0;
}

fn print_board(step_no: u16, state: &mut State, position: &mut Vec<Vec<u16>>) {
    let size_y = position.len();
    let size_x = position[0].len();

    let mut y = 0;
    while y < size_y {
        let mut x = 0;
        while x < size_x {
            let v = position[y][x];
            if v == 0 {
                print!("*{} ", " ".repeat(3));
            } else {
                print!("{: >3} ", v);
            }
            x = x + 1;
        }
        println!();
        y = y + 1;
    }
}

