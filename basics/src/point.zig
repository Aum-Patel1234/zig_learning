const std = @import("std");
const Point = @This();

a: i32,
b: i32,

pub fn init(a: i32, b: i32) Point {
    return .{ .a = a, .b = b };
}

pub fn move(p: *Point, x: i32, y: i32) void {
    p.a += x;
    p.b += y;
}

pub fn eucledian_distance(p1: *const Point, p2: *const Point) f64 {
    const x2: f64 = (p1.a - p2.a) * (p1.a - p2.a);
    const y2: f64 = (p1.b - p2.b) * (p1.b - p2.b);
    return std.math.sqrt(x2 + y2);
}
