import java.util.*;

public class Horse {

    public static void main(String[] args) {
        calc_horse(0, 0, 4, 7);
    }

    private static class State {
        int path_count_total = 0;
        int path_count_ok = 0;
    }

    private static void calc_horse(int x0, int y0, int size_x, int size_y) {
        System.out.println(String.format("Hello, horse, board %sx%s", size_x, +size_y));

        int[][] grid = new int[size_y][size_x];

        State state = new State();

        Date time_0 = new Date();
        step_horce(1, state, x0, y0, grid);
        Date time_1 = new Date();

        System.out.println(String.format("Board %sx%s, full path count: %s, total path count: %s", size_x, size_y, state.path_count_ok, state.path_count_total));

        double duration_sec = (time_1.getTime() - time_0.getTime()) / 1000.0;
        System.out.println("duration: " + duration_sec + " sec");
    }

    private static void step_horce(int step_no, State state, int x0, int y0, int[][] position) {
        // ---------------------
        // Make my step
        position[y0][x0] = step_no;

        // ---------------------
        // Print board after my step
        // print_board(step_no, state, position);
        // System.out.println();

        // ---------------------
        // Try to do next 8 step
        int size_y = position.length;
        int size_x = position[0].length;
        int board_size = size_x * size_y;

        int[][] step_diffs = {{1, -2}, {2, -1}, {2, 1}, {1, 2}, {-1, 2}, {-2, 1}, {-2, -1}, {-1, -2}};

        int steps_done = 0;
        for (int s = 0; s < 8; s++) {
            int[] step_diff = step_diffs[s];
            int x1 = x0 + step_diff[0];
            int y1 = y0 + step_diff[1];

            if (x1 < 0 || x1 >= size_x) {
                continue;
            }
            if (y1 < 0 || y1 >= size_y) {
                continue;
            }
            if (position[y1][x1] != 0) {
                continue;
            }

            step_horce(step_no + 1, state, x1, y1, position);

            steps_done = steps_done + 1;
        }

        // ---------------------
        // Whe nave no more steps?
        if (steps_done == 0) {
            state.path_count_total = state.path_count_total + 1;
        }

        if (steps_done == 0 && step_no == board_size) {
            state.path_count_ok = state.path_count_ok + 1;
            System.out.println(String.format("Full path count: %s/%s", state.path_count_ok, state.path_count_total));
            print_board(step_no, state, position);
            System.out.println();
        }

        if (steps_done == 0 && step_no != board_size) {
            //System.out.println("Path faled, path_count_total: " + state.path_count_total);
            //print_board(step_no, state, position);
            //System.out.println();
        }

        // ---------------------
        // Make my step back
        position[y0][x0] = 0;
    }

    private static void print_board(int step_no, State state, int[][] position) {
        int size_y = position.length;
        int size_x = position[0].length;

        int y = 0;
        while (y < size_y) {
            int x = 0;
            while (x < size_x) {
                int v = position[y][x];
                if (v == 0) {
                    System.out.print(String.format("%3s", "*") + " ");
                } else {
                    System.out.print(String.format("%3s", v) + " ");
                }
                x = x + 1;
            }
            System.out.println();
            y = y + 1;
        }
    }

}
