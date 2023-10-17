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

// use debug::PrintTrait;

// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// fn main() {
//     // let rectangle = Rectangle { width: 30, height: 10, };
//     let rectangle = Rectangle { height: 10, width: 30 }; // trying to put the struct members in any order
//     let area = area(rectangle);
//     area.print(); // print out the area
// }


// Adding Useful Functionality with Trait
// to print an instance of Rectangle while we’re debugging our program and see the values for all its fields

// use debug::PrintTrait;

// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// fn main() {
//     let rectangle = Rectangle { width: 30, height: 10, };
//     rectangle.print();
//  this wont work ... cannot use the print methos on the struct just like that
// }

// ADDING FUNCTIONALITY WITH TRAIT

// use debug::PrintTrait;

// fn area(rectangle: Rectangle) -> u64 {
//     rectangle.width * rectangle.height
// }

// struct Rectangle {
//     width: u64,
//     height: u64,
// }

// fn main() -> u64 {
//     let rectangle = Rectangle { width: 30, height: 10, } ;
//     // rectangle.print(); // only possible with the trait implementation as below
//     // area(rectangle).print(); // using the earlier declared function
//     area(rectangle) // the return value
// }

// impl RectanglePrintImpl of PrintTrait<Rectangle> {
//     fn print(self: Rectangle) {
//         self.width.print();
//         self.height.print();
//     }
// }

use debug::PrintTrait;
#[derive(Copy, Drop)]
struct Rectangle {
    width: u64,
    height: u64,
}

trait RectangleTrait {
    fn area(self: @Rectangle) -> u64;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        (*self.width) * (*self.height)
    }
}

fn main() {
    let rect1 = Rectangle { width: 30, height: 50, };

    rect1.area().print();
}
