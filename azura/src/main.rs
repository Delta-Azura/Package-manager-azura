use ferris_says::say;
use std::io::{stdout, BufWriter};
use std::process::Command; 
use std::fs::File; 

fn help() {
    println!("Hello, world!");
    let stdout = stdout();
    let message = String::from("Bienvenue dans Azura !");
    let width = message.chars().count();
    let mut writer = BufWriter::new(stdout.lock());
    say(message.as_bytes(), width, &mut writer).unwrap();
    println!("azura compile : compilera votre paquet")
}

fn log () {
    let mut file = File::create("/home/delta/doc/log.txt");
    
}
fn update() {
    Command::new("cards")
    .arg("diff")
    .spawn()
    .expect("erreur");
    
}

fn main() {
    log();
    help();
}
