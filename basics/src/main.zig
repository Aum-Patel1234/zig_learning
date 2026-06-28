const std = @import("std");
const Io = std.Io;

const basics = @import("basics");
const string_basics = @import("strings.zig");
const test_integer_overflow = @import("test_integer_overflow.zig");
const variables_convert = @import("variables_convert.zig");
const errors = @import("errors.zig");
const structs_unions_enum = @import("structs_unions_enums.zig");
const mem_management = @import("memory_management.zig");
const comptime_eg = @import("comptime.zig");
const Point = @import("point.zig");

pub fn main() void {
    var a: i5 = 1;
    a += 1;
    // var b = 1;
    if (a > 0) {
        std.debug.print("a={}\n", .{a});
    }

    const arr = [4]u8{ 1, 2, 3, 4 };
    for (arr) |value| {
        std.debug.print("{}", .{value});
    }

    std.debug.print("\n{}\n\n", .{basics.add(10, -6)});
    string_basics.string_basics();

    a = 1;
    if (a > 0 and a < 2) {
        std.debug.print("a=1", .{});
    } else {
        std.debug.print("a!=1", .{});
    }

    // test_integer_overflow.test_integer_overflow();
    basics.intersting();

    variables_convert.variables_convert();
    variables_convert.truncate();

    // errors
    errors.demonstrate_errors();

    // structs_unions_enums
    structs_unions_enum.show_unions();
    structs_unions_enum.show_enums();

    mem_management.show_mem_management();

    comptime_eg.show_comptime();

    // Self type
    const p1 = Point.init(0, 3);
    var p2 = Point.init(3, 0);
    std.debug.print("Point p1={}, p2={}.\n", .{ p1, p2 });
    p2.move(1, 0);
    std.debug.print("Point p1={}, p2={} (moved in x dir).\n", .{ p1, p2 });
    std.debug.print("Distance between p1 and p2 = {}\n\n\n", .{Point.eucledian_distance(&p1, &p2)});
}
