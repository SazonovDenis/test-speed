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

java Horse 3 4 7
~~~

###### Prime numbers

~~~
cd java/src

javac Primes.java 

java Primes 3 5
~~~

#### Rust

###### Knight's tour

~~~
cd rust/src

rustc main_horse.rs

main_horse.exe 3 4 7
~~~

###### Prime numbers

~~~
cd rust/src

rustc main_primes.rs

main_primes.exe 3 5
~~~

#### Python

###### Knight's tour

~~~
cd python

python horse.py 3 4 7
~~~

###### Prime numbers

~~~
cd python

python primes.py 3 5
~~~

#### Lazarus

###### Knight's tour

~~~
cd lazarus

fpc-B main_horse.lpr

main_horse.exe 3 4 7
~~~

###### Prime numbers

~~~
cd lazarus

fpc-B main_primes.lpr

main_primes.exe 3 5
~~~

#### Delphi 7

###### Knight's tour

~~~
cd lazarus

dcc32 /b horse.dpr

horse.exe 3 4 7
~~~

###### Prime numbers

~~~
cd lazarus

dcc32 /b primes.dpr

primes.exe 3 5
~~~

### Run parameters explanation

###### Knight's tour

~~~
horse.exe <attempts count> <board size x> <board size y>
~~~

###### Prime numbers

~~~
primes.exe <attempts count> <prime number count for one attempt>
~~~
