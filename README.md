# Demonstrating the interop between haskell and rust

Using the haskell FFI and using C types for interop

## Running

```bash
make && ./main && make clean
```

## Learning

- Disable name mangling.
  - Name mangling is the compiler adding extra info to the function name to better understand it and to resolve name conflicts. If we name our function `ABC` and we want to call it `ABC` in the other language, we’ll have to disable this.
- `extern “C”`, so that `rustc` emits a function that is callable by another language as if it was written in C.
- Have to make the rust executable a dynamic library with `dylib` in cargo.
  - A dynamic library exists seperately form the main code, ie, it isn't "locked in" into final executable you will build.
  - In linux, these are `.so` files. Files with the “. so” extension are dynamically linked shared object libraries, and loaded at runtime. For example, `libtensorflow.so` is a dynamic library that does not need to be compiled _into_ the executable. Our library will be similar in that regard.
- C doesn't have "enums", so we'll return an "opaque pointer" (C jargon, basically a pointer which you can only manipulate with helper functions you define). We'll also use opaque pointer for functions whose complexity we want to abstract. In rust, we'll also have to define funtions to **clear the memory** as the python code doesn't _own_ the data, rust does.
- Instead of passing opaque pointers, and then defining functions to free it, you can also pass a pointer to a mutable buffer which you populate in rust, in cases where it makes sense. A real life example is opencv's image manipulation libraries, and if you use the rust wrapper, you have to do exactly that.

## resources

- [Calling rust from python](https://bheisler.github.io/post/calling-rust-in-python/)
- [Rust FFI omnibus](http://jakegoulding.com/rust-ffi-omnibus/). This is gonna be useful as it contains haskell examples.
