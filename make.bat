cd java/src

javac Horse.java

javac Primes.java 

cd ../..



cd rust/src

rustc main_horse.rs

rustc main_primes.rs

cd ../..



cd lazarus

fpc -B main_horse.lpr

fpc -B main_primes.lpr

cd ..



cd lazarus

dcc32 /b horse.dpr

dcc32 /b primes.dpr

cd ..
