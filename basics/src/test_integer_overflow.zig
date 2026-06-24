const std = @import("std");

pub fn test_integer_overflow() void {
    var a: i8 = 127;
    std.debug.print("\n\ntest_integer_overflow:\na={}\n", .{a});
    a += 1;
    std.debug.print("a={}\n", .{a});
}
