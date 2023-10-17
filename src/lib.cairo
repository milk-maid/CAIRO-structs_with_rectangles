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
    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool;
    fn square(size: u64) -> Rectangle;
}

impl RectangleImpl of RectangleTrait {
    fn area(self: @Rectangle) -> u64 {
        *self.width * *self.height
    }

    fn can_hold(self: @Rectangle, other: @Rectangle) -> bool {
        *self.width > *other.width && *self.height > *other.height
    }

    fn square(size: u64) -> Rectangle {
        Rectangle { width: size, height: size }
    }
}


fn main() {
    let rect1 = Rectangle { width: 30, height: 50, };
    let rect2 = Rectangle { width: 10, height: 40, };
    let rect3 = Rectangle { width: 60, height: 45, };

    'Can rect1 hold rect2?'.print();
    rect1.can_hold(@rect2).print();

    'Can rect1 hold rect3?'.print();
    rect1.can_hold(@rect3).print();

    rect1.area().print();

    let square = RectangleImpl::square(10);
    let squareA = RectangleImpl::square(5);
    square.area().print();
    square.can_hold(@squareA).print();

    // RectangleTrait::square(10);
    RectangleTrait::square(10).area().print();

    let msg: Message = Message::Quit;
    msg.process();
    let ech: Message = Message::Echo(16);
    ech.process();
    let mve: Message = Message::Move((11, 9));
    mve.process();

}

#[derive(Drop)]
enum Message {
    Quit,
    Echo: felt252,
    Move: (u128, u128),
}

trait Processing {
    fn process(self: Message);
}

impl ProcessingImpl of Processing {
    fn process(self: Message) {
        match self {
            Message::Quit => { 'quitting'.print(); },
            Message::Echo(value) => { value.print(); },
            Message::Move((x, y)) => { 'moving'.print(); },
        }
    }
}

