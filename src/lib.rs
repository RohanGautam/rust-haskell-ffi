// use std::thread;
use std::time::Duration;

#[no_mangle]
pub extern "C" fn load_something(millis: u64) -> bool {
    println!("Loading things..");
    std::thread::sleep(Duration::from_millis(millis));
    println!("Finished loading!!");
    true
}

#[no_mangle]
pub extern "C" fn double_input(input: i32) -> i32 {
    input * 2
}
