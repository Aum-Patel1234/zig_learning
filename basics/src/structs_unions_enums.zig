const std = @import("std");

const Number = union(enum) { small: u8, medium: u16, large: u32 };

pub fn show_unions() void {
    var number = Number{ .small = 9 };
    std.debug.print("{}:{}\n", .{ number.small, @TypeOf(number.small) });

    number = Number{ .medium = 9 };
    std.debug.print("{}:{}\n", .{ number.medium, @TypeOf(number.medium) });

    number = Number{ .large = 9 };
    try_printing_inactive_field(number);

    std.debug.print("\n\n", .{});
}
fn try_printing_inactive_field(number: Number) void {
    switch (number) {
        .medium => |value| {
            std.debug.print("{}", .{value});
        },
        .large => |s| {
            std.debug.print("not medium, its type is {}\n", .{@TypeOf(s)});
        },
        .small => |s| {
            std.debug.print("not medium, its type is {}\n", .{@TypeOf(s)});
        },
    }
}

const Direction = enum {
    north,
    south,
    east,
    west,
};

const Status = enum(u16) {
    ok = 200,
    not_found = 404,
    server_error = 500,
};

const User = struct {
    name: []const u8,
    role: Role,
};
const Role = enum {
    admin,
    user,
    guest,

    fn isAdmin(self: Role) bool {
        return self == .admin;
    }
};

pub fn show_enums() void {
    const dir: Direction = .north;

    std.debug.print("Direction: {}\n", .{dir});

    // enum with switch
    switch (dir) {
        .north => std.debug.print("Going north\n", .{}),
        .south => std.debug.print("Going south\n", .{}),
        .east => std.debug.print("Going east\n", .{}),
        .west => std.debug.print("Going west\n", .{}),
    }

    // enum with custom integer values
    const status: Status = .ok;
    const code = @intFromEnum(status);
    std.debug.print("Status: {}, code: {}\n", .{ status, code });

    // enum inside struct
    const user = User{
        .name = "Aum",
        .role = .admin,
    };
    std.debug.print("User {s} role {}\n", .{ user.name, user.role });

    // enum method
    if (user.role.isAdmin()) {
        std.debug.print("User is admin\n", .{});
    }

    // get enum tag name as string
    const role_name = @tagName(user.role);
    std.debug.print("Role name: {s}\n", .{role_name});
}
