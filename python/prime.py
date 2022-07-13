import datetime


def is_prime_number(number):
    i = 2
    while i < number:
        if number % i == 0:
            return False
        i = i + 1

    return True


def print_primes(from_number):
    n = from_number
    while True:
        time_0 = datetime.datetime.now()
        is_prime = is_prime_number(n)
        time_1 = datetime.datetime.now()

        if is_prime:
            duration = int(diff_msec(time_1, time_0))
            print(str(n) + ", " + str(duration) + " msec")

        n = n + 1


def diff_msec(dt_2, dt_1):
    done_msec = (dt_2 - dt_1).days * 24 * 60 * 60 * 1000 + (dt_2 - dt_1).seconds * 1000 + (dt_2 - dt_1).microseconds / 1000
    return done_msec


def main():
    print_primes(100_000_000)


###
main()
