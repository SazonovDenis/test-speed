# Programming languages speed compare

Project contains two simple tests to compare speed of different 
programming languages: Java, Python, Rust, Lazarus/Delphi.

Two test implemented: 
- Search all knight's tours (brute-force algorithm)
- Print prime numbers (naive algorithm) 

### How to run

Clone project with demos:

~~~
git clone https://github.com/SazonovDenis/test-speed.git

cd test-speed
~~~

Compile and run for each language (appropriate compiler needed):

#### Java

###### Knight's tour

~~~
cd java/src

javac Horse.java

java Horse
~~~

###### Prime numbers

~~~
cd java/src

javac Primes.java 

java Primes
~~~

#### Rust

###### Knight's tour

~~~
cd rust/src

rustc main_horse.rs

main_horse.exe
~~~

###### Prime numbers

~~~
cd rust/src

rustc main_prime.rs

main_prime.exe
~~~

#### Python

###### Knight's tour

~~~
cd python

python horse.py
~~~

###### Prime numbers

~~~
cd python

python prime.py
~~~

### Lazarus

###### Knight's tour

~~~
cd lazarus

fpc main_horse.lpr

main_horse.exe
~~~

###### Prime numbers

~~~
cd lazarus

fpc main_primes.lpr

main_primes.exe
~~~

### Delphi 7

###### Knight's tour

~~~
cd lazarus

dcc32 horse.dpr

horse.exe
~~~

###### Prime numbers

~~~
cd lazarus

dcc32 primes.dpr

primes.exe
~~~


