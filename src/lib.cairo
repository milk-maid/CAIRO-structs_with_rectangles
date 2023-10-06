// use debug::PrintTrait;
// fn main() {
//     let width1 = 30;
//     let height1 = 10;
//     let area = area(width1, height1);
//     area.print();
// }

// fn area(width: u64, height: u64) -> u64 {
//     width * height
// }


// REFACTORING OUR CODE (with TUPLES)

// use debug::PrintTrait;
// fn main() {
//     let rectangle = (30, 10);
//     let area = area(rectangle);
//     area.print(); // print out the area
// }

// fn area(dimension: (u64, u64)) -> u64 {
//     let (x, y) = dimension;
//     x * y
// }

//  REFACTORING WITH STRUCTS : Adding more meaning

use debug::PrintTrait;

struct Rectangle {
    width: u64,
    height: u64,
}

fn main() {
    // let rectangle = Rectangle { width: 30, height: 10, };
    let rectangle = Rectangle { height: 10, width: 30 }; // trying to put the struct members in any order
    let area = area(rectangle);
    area.print(); // print out the area
}

fn area(rectangle: Rectangle) -> u64 {
    rectangle.width * rectangle.height
}