cd java/src

javac Horse.java

javac Primes.java 

cd ../..



cd rust/src

rustc -C opt-level=3 -C debuginfo=0 -C overflow-checks=off main_horse.rs

rustc -C opt-level=3 -C debuginfo=0 -C overflow-checks=off main_primes.rs

cd ../..



cd lazarus

fpc -B -OWall -CX -XX -Xs- -al -FWmain_horse.wpo main_horse.lpr

fpc -B -OWall -CX -XX -Xs- -al -FWmain_primes.wpo main_primes.lpr

cd ..



cd lazarus

dcc32 /b -Drelease horse.dpr

dcc32 /b -Drelease primes.dpr

cd ..
