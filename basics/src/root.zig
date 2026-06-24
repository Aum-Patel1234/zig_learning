const std = @import("std");

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn multiply(a: i32, b: i32) i32 {
    return a * b;
}

pub fn intersting() void {
    std.debug.print("\n\n", .{});
    outer: for (0..3) |i| {
        for (0..2) |j| {
            if (i == 1 and 1 == j)
                break :outer;
            std.debug.print("i={}, j={}\n", .{ i, j });
        }
    }
}
