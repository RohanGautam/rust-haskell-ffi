EXT=rlib # on linux
all: target/release/libhaskell_ffi.$(EXT)
	stack ghc -- src/Main.hs target/release/libhaskell_ffi.$(EXT) -o main

target/release/libhaskell_ffi.$(EXT): src/lib.rs Cargo.toml
	cargo build --release

clean:
	rm -rf target
	rm main
	rm src/*.o src/*.hi