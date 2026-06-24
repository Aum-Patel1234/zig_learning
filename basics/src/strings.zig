const std = @import("std");

pub fn string_basics() void {
    const ch: u8 = 'f';
    std.debug.print("{c}\n", .{ch});

    const str = "hello";
    std.debug.print("{s}\n", .{str});

    const char_arr = [5]u8{ 'H', 'e', 'l', 'l', 'o' };
    std.debug.print("char array - {s}\n\n", .{char_arr});
}
