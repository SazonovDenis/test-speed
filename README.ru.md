# Сравнение скорости языков программирования

В проекте содержится два простых теста для сравнения скорости языков программирования:
Java, Python, Rust, Lazarus/Delphi.

Реализовано два теста:

- Поиск всех маршрутов шахматного коня (полным перебором)
- Печать простых чисел (примитивным алгоритмом)

### Как запустить

Склонируйте проект с примерами:

~~~
git clone https://github.com/SazonovDenis/test-speed.git

cd test-speed
~~~

Соберите и запустите для каждого языка (потребуется соответствующий компилятор):

#### Java

###### Маршруты коня

~~~
cd java/src

javac Horse.java

java Horse 3 4 7
~~~

###### Простые числа

~~~
cd java/src

javac Primes.java 

java Primes 3 5
~~~

#### Rust

###### Маршруты коня

~~~
cd rust/src

rustc main_horse.rs

main_horse.exe 3 4 7
~~~

###### Простые числа

~~~
cd rust/src

rustc main_primes.rs

main_primes.exe 3 5
~~~

#### Python

###### Маршруты коня

~~~
cd python

python horse.py 3 4 7
~~~

###### Простые числа

~~~
cd python

python primes.py 3 5
~~~

#### Lazarus

###### Маршруты коня

~~~
cd lazarus

fpc-B main_horse.lpr

main_horse.exe 3 4 7
~~~

###### Простые числа

~~~
cd lazarus

fpc-B main_primes.lpr

main_primes.exe 3 5
~~~

#### Delphi 7

###### Маршруты коня

~~~
cd lazarus

dcc32 /b horse.dpr

horse.exe 3 4 7
~~~

###### Простые числа

~~~
cd lazarus

dcc32 /b primes.dpr

primes.exe 3 5
~~~

### Пояснение по параметрам запуска

###### Маршруты коня

~~~
horse.exe <количество запусков> <размер доски x> <размер доски y>
~~~

###### Простые числа

~~~
primes.exe <количество запусков> <количество простых чисел в одном запуске>
~~~
