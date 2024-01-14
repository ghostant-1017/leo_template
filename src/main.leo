// The 'leo_template' program.
program leo_template.aleo {
    transition get_tuple() -> (u8, u8) {
        let x: u8 = 0u8;
        let y: u8 = 1u8;
        return (x, y);
    }
    // **Alternative syntax for the above transition.**
    // struct Point {
    //     x: u8,
    //     y: u8
    // }

    // transition get_struct() -> Point {
    //     let p: Point = Point { x: 0u8, y: 0u8 };
    //     return p;
    // }
}
