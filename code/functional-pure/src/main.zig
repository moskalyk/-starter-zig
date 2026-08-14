const std = @import("std");
const Io = std.Io;

pub fn mapping(allocator: std.mem.Allocator, input: []u8, func: fn (u8) u8) !std.ArrayList(u8) {
    var output = try std.ArrayList(u8).initCapacity(allocator, input.len);
    for (input) |c| {
        try output.append(allocator, func(c));
    }
    return output;
}

pub fn main(init: std.process.Init) !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    _ = init.io;
    // const io = init.io;

}

pub fn makeEven(n: u8) u8 {
    return n * 2;
}

test "test filter on i32 slice" {
    const allocator = std.testing.allocator;
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(allocator); 

    try list.append(allocator, 0);
    try list.append(allocator, 1);
    try list.append(allocator, 2); 

    var items = try mapping(allocator, list.items, makeEven);

    defer items.deinit(allocator);
    try std.testing.expectEqualSlices(u8, items.items, &[_]u8{ 0, 2, 4 });
}

test "arena allocator" {
    var arena: std.heap.ArenaAllocator = .init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    _ = try allocator.alloc(u8, 1);
    _ = try allocator.alloc(u8, 10);
    _ = try allocator.alloc(u8, 100);
}