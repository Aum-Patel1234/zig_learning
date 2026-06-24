const std = @import("std");

pub fn variables_convert() void {
    // converting variables
    const a: i5 = -10;
    //  Normal integer conversion
    // ERROR: -10 cannot fit inside u8 (0 to 255)
    // const b: u8 = @intCast(a);
    const b: u5 = @bitCast(a);
    std.debug.print("a:{} = {}, b:{} = {}\n\n", .{ @TypeOf(a), a, @TypeOf(b), b });
}

pub fn truncate() void {
    const a: i32 = 1000000;
    const trunc_a: i16 = @truncate(a);
    std.debug.print("a(binary)  = {b}\ntrunc_a(binary) = {b}\n\n", .{ a, trunc_a });

    const c: u8 = 200;
    const d: u8 = 222;
    // ERROR:
    // const add: u16 = c + d;
    const add: u16 = @as(u16, c) + @as(u16, d);
    std.debug.print(
        \\c   = {}  type = {any}
        \\d   = {}  type = {any}
        \\add = {}  type = {any}
        \\
        \\
    , .{
        c,   @TypeOf(c),
        d,   @TypeOf(d),
        add, @TypeOf(add),
    });
}
