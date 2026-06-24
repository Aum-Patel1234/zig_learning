const std = @import("std");

const MAX_I32 = std.math.maxInt(i32);
const MIN_I32 = std.math.minInt(i32);

const AddingError = error{ IntegerOverflowHigh, IntegerOverflowLow };

pub fn demonstrate_errors() void {
    const a: i32 = 3;
    const b: i32 = 12;
    const maxI32: i32 = std.math.maxInt(i32);
    const r1 = add(a, b);
    const r2 = add(maxI32, b);
    print_result_err(r1, a, b);
    print_result_err(r2, maxI32, b);

    // if func returns erro catch {something} will set to default value=something
    const res = add(a, maxI32) catch maxI32;
    print_result_err(res, a, b);
    demonstrate_try();

    std.debug.print("\n\n", .{});
}

pub fn add(a: i32, b: i32) AddingError!i32 {
    const temp: i64 = @as(i64, a) + @as(i64, b);
    if (temp > MAX_I32)
        return AddingError.IntegerOverflowHigh;
    if (temp < MIN_I32)
        return AddingError.IntegerOverflowLow;
    return a + b;
}

pub fn print_result_err(res: AddingError!i32, a: i32, b: i32) void {
    if (res) |value| {
        std.debug.print("Adding 23+3 in i32 = {}.\n", .{value});
    } else |err| {
        std.debug.print("Add error {} on adding {} + {}\n", .{ err, a, b });
    }
}

pub fn demonstrate_try() void {
    if (returns_err()) |_| {
        unreachable;
    } else |err| {
        std.debug.print("Error demonstraion using try ... got err {}", .{err});
    }
}
pub fn returns_err() !void {
    _ = try add(std.math.minInt(i32), -2);
}
