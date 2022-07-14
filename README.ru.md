# Сравнение скорости языков программирования

В проекте содержится два простых теста для сравнения скорости 
языков программирования: Java, Python, Rust, Lazarus/Delphi.

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

java Horse
~~~

###### Простые числа

~~~
cd java/src

javac Primes.java 

java Primes
~~~

#### Rust

###### Маршруты коня

~~~
cd rust/src

rustc main_horse.rs

main_horse.exe
~~~

###### Простые числа

~~~
cd rust/src

rustc main_prime.rs

main_prime.exe
~~~

#### Python

###### Маршруты коня

~~~
cd python

python horse.py
~~~

###### Простые числа

~~~
cd python

python prime.py
~~~

### Lazarus

###### Маршруты коня

~~~
cd lazarus

fpc main_horse.lpr

main_horse.exe
~~~

###### Простые числа

~~~
cd lazarus

fpc main_primes.lpr

main_primes.exe
~~~

### Delphi 7

###### Маршруты коня

~~~
cd lazarus

dcc32 horse.dpr

horse.exe
~~~

###### Простые числа

~~~
cd lazarus

dcc32 primes.dpr

primes.exe
~~~


