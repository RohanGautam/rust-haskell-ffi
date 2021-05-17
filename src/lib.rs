// use std::thread;
// use std::time::Duration;

#[no_mangle]
pub extern "C" fn load_something(millis: i32) -> bool {
    println!("In rust, got: {}", millis);
    true
}

#[no_mangle]
pub extern "C" fn double_input(input: i32) -> i32 {
    input * 2
}
