const std = @import("std");
const errors = @import("errors.zig");
const pointers = @import("pointers.zig");

fn mul(comptime T: type, a: T, b: T) errors.AddingError!T {
    return a + b;
}

pub fn show_comptime() void {
    std.debug.print("comptime examples:\n", .{});
    std.debug.print("f16: 3+3.4 = {any}\n", .{mul(f16, 3, 3.4)});
    std.debug.print("u8: 3+3 = {any}\n", .{mul(u8, 3, 3)});
    std.debug.print("'4'+'4' = {any} (ascii value 4 = {})\n", .{ mul(u8, '4', '4'), '4' });

    // pointers

    std.debug.print("\n\n\n", .{});
}
