use std::thread;
use std::time::Duration;

#[no_mangle]
pub extern "C" fn load_something(millis: i32) -> bool {
    sleep(millis);
    true
}
fn sleep(millis: i32) {
    thread::sleep(Duration::from_millis(millis as u64));
}

#[no_mangle]
pub extern "C" fn double_input(input: i32) -> i32 {
    input * 2
}
