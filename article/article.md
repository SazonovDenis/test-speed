# Компиляторы против компиляторов [UPD]

![title.png](title.png)

#### Сравнение производительности Rust, Delphi и Lazarus (а также Java и Python) 

Давно хотел познакомиться с Rust. Язык с экосистемой сборки из коробки, компилятор в машинный код, 
но самое главное — автоматическое управление памятью, но без сборщика мусора.
С учетом того, что управление памятью обещается как zero-cost в runtime — просто сказка! 
По ходу изучения и возник вопрос – а насколько код Rust быстрее/медленнее 
компилятора в машинный код давно известного, например, Delphi?


#### О тесте

Для ответа на вопрос были написаны два простых теста: "обход конем доски" (в основном
работа с памятью) и "поиск простых чисел" (в основном целочисленная математика). Ну и раз
пошло такое дело, то почему бы не вовлечь в соревнования языки из другой "весовой
категории" — чисто для сравнения и забавы. Так, в качестве специально приглашенных 
гостей, в забеге стали участвовать Java (компилируемый в байт-код) и Python (чистый интерпретатор). 
Си к соревнованию допущен не был по причине моего слабого знания оного 
(кто напишет свою реализацию тестов — добро пожаловать, включу в статью).

Алгоритмы сделаны по-простому, главное, чтобы создавалась нужная нагрузка. Для обхода конем доски выбрана доска 4х7, 
это разумная величина, чтобы тест не проходил слишком быстро, но и не закончился лишь после угасания Солнца.
Простые числа ищем начиная со 100 млн, иначе слишком быстро. 

<details>
<summary>Обход конем доски, реализация на java.</summary>

```java
/**
 * Store for statistic
 */
static class State {
    int path_count_total = 0;
    int path_count_ok = 0;
}

/**
 * Calc and print all full knight's tours over specified board
 *
 * @param size_x board size x
 * @param size_y board size y
 * @param x0     tour start cell x
 * @param y0     tour start cell y
 */
static void calc_horse(int size_x, int size_y, int x0, int y0) {
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
    // Try to do next 8 steps
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
    // Whe have no more cell to step?
    if (steps_done == 0) {
        state.path_count_total = state.path_count_total + 1;
    }

    if (steps_done == 0 && step_no == board_size) {
        state.path_count_ok = state.path_count_ok + 1;
        System.out.println(String.format("Full path count: %s/%s", state.path_count_ok, state.path_count_total));
        print_board(position);
        System.out.println();
    }

    // ---------------------
    // Make my step back
    position[y0][x0] = 0;
}
```

</details>

<details>
<summary>Поиск простых чисел, реализация на java.</summary>

~~~java
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
~~~

</details>

На всех языках алгоритм одинаковый. Полный комплект тестов [выложен на GitHub](https://github.com/SazonovDenis/test-speed).


#### Ожидания

Мои ожидания были такими: первое-второе места разделят Delphi/Lazarus и Rust, с разницей плюс-минус
50% — машинный код он и в Африке машинный код.

С заметным отставанием, от двух раз и более — Java. Все-таки байт-код это дополнительный уровень не бесплатной абстракции.

Ну и в хвосте, задыхающийся и вспотевший, с отставанием в десяток и более раз будет Python.


#### Тестовая машина

Windows 10<br>
i5-3470, 3.2 ГГц<br>
ОЗУ 8 ГБ

По наблюдениям - каждый тест нагружает одно ядро четырехъядерного процессора (так и должно быть).
Сборщику мусора, судя по всему, не приходится срабатывать, т.к. память выделяется небольшая.

<details>
<summary>Загрузка процессора.</summary>

![process1.png](process1.png)

![process2.png](process2.png)

![process3.png](process3.png)

</details>


#### Итог испытаний

Результат лично для меня оказался неожиданным. Вот вы какого результата ожидали бы?

![result.png](result.png)

Python не разочаровал, стабильность результата — признак профессионала :-). 

Код Rust оказался медленнее на 50%-400%, чем Delphi/Lazarus, что несколько разочаровывает, хотя и в
пределах ожиданий.

А вот Java сильно удивила. За много лет работы с ней не доводилось вот так, напрямую, замерять
производительность и её скорость оказалась приятным сюрпризом. Нет, мы знаем — JIT творит
чудеса и все такое, но, чтобы на равных с машинным кодом...


#### Итого

Выводы для себя я сделал следующие: 

- Java рулит;
- Если на Java есть кусок тормозного кода, который хочется переписать 
  на чем-нибудь компилируемом — не следует ожидать кратного прироста скорости. 
  Проблема, скорее всего, в другом месте, а не в "тормознутости" Java;
- Если хочется чего-нибудь компилируемого и быстрого, но C++ пугает, то использовать Rust вместо Си пока рано. 
  Нужен язык с компилятором и быстрым кодом - это пока все-таки Си или Free Pascal. 


#### UPD 1:

В [комментариях](https://habr.com/ru/post/678628/#comment_24557980) справедливо [ткнули](https://habr.com/ru/post/678628/#comment_24558008) носом в то, что мои тесты на Rust собраны в отладочном режиме.
Каюсь, это огромное упущение. В оправдание скажу, что в языках, с которыми работал до этого (Delphi, Java и Python), скорость "релизной" и "отладочной" версий хоть и различается, но не так драматично.
Учет замечания радикально меняет вывод об "отставании" Rust. Собрав тесты в релизе (Rust, Delphi, Lazarus) получаем результат:

![result-release.png](result-release.png)

Оптимизированный код Rust оказался на 20%-200%, быстрее чем Delphi/Lazarus, что приятно и в пределах ожиданий.


#### Итого (исправленное):

- Java рулит;

- Если на Java есть кусок тормозного кода, который хочется переписать на чем-нибудь компилируемом — не следует ожидать кратного прироста скорости. Проблема, скорее всего, в другом месте, а не в "тормознутости" Java;

- Если хочется чего-нибудь компилируемого и быстрого, но C++ пугает, то Rust вместо Си — прекрасная альтернатива.


#### UPD 2:

В [комментариях](https://habr.com/ru/post/678628/#comment_24557908) указали на [влияние](https://habr.com/ru/post/678628/#comment_24557988) 
лишнего консольного вывода на результаты. Да, действительно, он заметно влияет на время выполнения, особенно на "быстрые" языки. 
Согласен, его нужно было сразу убрать, однако лишний вывод влияет _одинаково на всех_ и мало влияет на _сравнительные_ результаты. 
<details>
<summary>Влияние лишнего вывода.</summary>

![result-print.png](result-print.png)

</details>
