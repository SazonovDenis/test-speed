import datetime


def print_board(step_no, state, position):
    size_y = len(position)
    size_x = len(position[0])

    y = 0
    while (y < size_y):
        x = 0
        while (x < size_x):
            v = position[y][x]
            if (v == 0):
                print("*".rjust(3) + " ", end="")
            else:
                print(str(v).rjust(3) + " ", end="")
            x = x + 1

        print()
        y = y + 1


def step_horce(step_no, state, x0, y0, position):
    step_diffs = [[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]]

    # ---------------------
    # Make my step
    position[y0][x0] = step_no

    # ---------------------
    # Print board after my step
    # print_board(step_no, state, position)
    # print()

    # ---------------------
    # Try to: next 8 step
    size_y = len(position)
    size_x = len(position[0])
    board_size = size_x * size_y

    steps_done = 0
    for s in range(8):
        x1 = x0 + step_diffs[s][0]
        y1 = y0 + step_diffs[s][1]

        if (x1 < 0) or (x1 >= size_x):
            continue

        if (y1 < 0) or (y1 >= size_y):
            continue

        if (position[y1][x1] != 0):
            continue

        step_horce(step_no + 1, state, x1, y1, position)

        steps_done = steps_done + 1

    # ---------------------
    # Whe nave no more steps?
    if (steps_done == 0):
        state["path_count_total"] = state["path_count_total"] + 1

    if (steps_done == 0) and (step_no == board_size):
        state["path_count_ok"] = state["path_count_ok"] + 1
        print("Full path count: " + str(state["path_count_ok"]) + "/" + str(state["path_count_total"]))
        print_board(step_no, state, position)
        print("")

    if (steps_done == 0) and (step_no != board_size):
        # print("Path faled, path_count_total: " + str(state["path_count_total"]))
        # print_board(step_no, state, position)
        # print()
        pass

    # ---------------------
    # Make my step back
    position[y0][x0] = 0


def diff_msec(dt_2, dt_1):
    done_msec = (dt_2 - dt_1).days * 24 * 60 * 60 * 1000 + (dt_2 - dt_1).seconds * 1000 + (dt_2 - dt_1).microseconds / 1000
    return done_msec


def calc_horse(x0, y0, size_x, size_y):
    print("Hello, horse, board " + str(size_x) + "x" + str(size_y))

    grid = [[0] * size_x for i in range(size_y)]

    state = {"path_count_ok": 0, "path_count_total": 0}

    time_0 = datetime.datetime.now()
    step_horce(1, state, x0, y0, grid)
    time_1 = datetime.datetime.now()

    print("Board " + str(size_x) + "x" + str(size_y) + ", full path count: " + str(state["path_count_ok"]) + ", total path count: " + str(
        state["path_count_total"]))

    duration_sec = int(diff_msec(time_1, time_0)) / 1000
    print("duration: " + str(duration_sec) + " sec")


def main():
    calc_horse(0, 0, 4, 7)


###
main()
