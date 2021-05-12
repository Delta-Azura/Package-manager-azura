use std::fs;
use std::fs::File;
use std::io::Read;

fn main() {
    let data = "First log!";
    fs::write("/home/delta/doc/doc", data).expect("Unable to write file");
    let mut g = String::new();
    let mut f = File::open("/home:delta/doc/doc").expect("Unable to open file");
    f.read_to_string(&mut g).expect("Unable to read string");
    println!("{}", g);
    println!("done")
}
