const std = @import("std");

test "many-item pointer arithmetic" {
    var array = [_]i32{ 10, 20, 30, 40 };

    // Coerce a single-item pointer of an array into a many-item pointer
    var ptr: [*]i32 = &array;

    try std.testing.expect(ptr[0] == 10);

    // Advance the pointer by one i32 element (4 bytes)
    ptr += 1;
    // std.debug.print("{any}", .{ptr});
    try std.testing.expect(ptr[0] == 20);

    // Subtracting works similarly
    ptr -= 1;
    try std.testing.expect(ptr[0] == 10);
}
