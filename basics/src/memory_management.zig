const std = @import("std");

fn show_page_allocator() void {
    const allocator = std.heap.page_allocator;
    const nums = allocator.alloc(i32, 5) catch unreachable;
    defer allocator.free(nums);

    nums[0] = 10;
    nums[1] = 20;
    nums[2] = 30;
    nums[3] = 40;
    nums[4] = 50;

    std.debug.print("page_allocator - {any}\n ", .{nums});
}

fn show_fixed_buff_allocator() void {
    var buffer: [100]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();
    const text = allocator.alloc(u8, "Hello Fixed Buffer".len) catch unreachable;
    defer allocator.free(text);
    @memcpy(text, "Hello Fixed Buffer");
    std.debug.print("{s}\n", .{text});
}

fn show_arena_allocator() void {
    // ArenaAllocator:
    // - A memory allocator that allocates many objects from a single arena.
    // - All allocations come from the arena's memory region.
    // - Individual allocations cannot be freed separately.
    // - When you call deinit(), the entire arena memory is released at once.
    //
    // Why use ArenaAllocator?
    // - Faster than allocating/freeing every object individually.
    // - Useful when many objects have the same lifetime.
    // - Good for temporary data, parsing, ASTs, game frames, etc.
    //
    // Example:
    //   Allocate 100 objects
    //   Use them
    //   Call deinit()
    //   All 100 objects are freed together.
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_allocator.deinit();
    const allocator = arena_allocator.allocator();

    const n1 = allocator.alloc(i32, 1) catch unreachable;
    n1[0] = 1;
    std.debug.print("arr of size {} - {}\n", .{ n1.len, n1[0] });

    const n2 = allocator.alloc(i32, 10) catch unreachable;
    for (0..n2.len) |i| {
        n2[i] = @intCast(i);
    }
    std.debug.print("another arr - {any}", .{n2});
}

fn show_general_purpose_allocator() void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer {
        const leaked = gpa.deinit();
        if (leaked == .leak) {
            std.debug.print("Memory leak detected!\n", .{});
        }
    }
    const allocator = gpa.allocator();
    const numbers = allocator.alloc(i32, 5) catch unreachable;
    defer allocator.free(numbers);

    numbers[0] = 1;
    numbers[1] = 2;
    numbers[2] = 3;
    numbers[3] = 4;
    numbers[4] = 5;

    std.debug.print("\n{any}\n", .{numbers});
}

pub fn show_mem_management() void {
    std.debug.print("Heap allocated using arena_allocator:\n", .{});
    show_page_allocator();
    show_fixed_buff_allocator();
    show_arena_allocator();
    show_general_purpose_allocator();
    std.debug.print("\n\n\n", .{});
}
