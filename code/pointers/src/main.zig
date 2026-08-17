const std = @import("std");
const Io = std.Io;

const pointers = @import("pointers");

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointers" {
    var x: u8 = 1;
    increment(&x);
    var score: i32 = 42;
    var score1: i32 = 42;
    const ptr: *i32 = &score;
    const ptr2: *i32 = &score1;

    std.debug.print("score = {}\n", .{score});
    std.debug.print("via pointer = {}\n", .{ptr.*});
    std.debug.print("address = {*}\n", .{ptr});
    std.debug.print("via pointer = {}\n", .{ptr2.*});
    std.debug.print("via pointer2 = {}\n", .{ptr2});

    try std.testing.expectEqual(@as(u8, 2), x);
    //this is to split by spaces

    const input = "Hello@World";
    var iter = std.mem.splitAny(u8, input, "@");
    while  (iter.next()) |word| {
        std.debug.print("{s}\n", .{word});
    }

    // const value: i32 = 42;
    var buffer1: [256]u8 = undefined;
    var buffer2: [256]u8 = undefined;
    const str = try std.fmt.bufPrint(&buffer1, "{}", .{ptr2});
    const str1 = try std.fmt.bufPrint(&buffer2, "{}", .{ptr});
    var iter2 = std.mem.splitAny(u8, str, "@");
    var iter3 = std.mem.splitAny(u8, str1, "@");
    var i: i32 = 0;

    while  (iter2.next()) |word| {
        if(i == 1) std.debug.print("{any}\n", .{std.fmt.parseInt(u8, word, 16)});
        if(i == 1) {
            std.debug.print("{s}\n", .{word});
            while  (iter3.next()) |word1| {
                if(i == 2){
                    std.debug.print("{}\n", .{&word1});
                    std.debug.print("{s}\n", .{word1});
                    std.debug.print("{}\n", .{&word - &word1});
                }
                i += 1;
            }
        }
        i += 1;
    }
}

test "fuzz example" {
    try std.testing.fuzz({}, testOne, .{});
}

fn testOne(context: void, smith: *std.testing.Smith) !void {
    _ = context;
    // Try passing `--fuzz` to `zig build test` and see if it manages to fail this test case!

    const gpa = std.testing.allocator;
    var list: std.ArrayList(u8) = .empty;
    defer list.deinit(gpa);
    while (!smith.eos()) switch (smith.value(enum { add_data, dup_data })) {
        .add_data => {
            const slice = try list.addManyAsSlice(gpa, smith.value(u4));
            smith.bytes(slice);
        },
        .dup_data => {
            if (list.items.len == 0) continue;
            if (list.items.len > std.math.maxInt(u32)) return error.SkipZigTest;
            const len = smith.valueRangeAtMost(u32, 1, @min(32, list.items.len));
            const off = smith.valueRangeAtMost(u32, 0, @intCast(list.items.len - len));
            try list.appendSlice(gpa, list.items[off..][0..len]);
            try std.testing.expectEqualSlices(
                u8,
                list.items[off..][0..len],
                list.items[list.items.len - len ..],
            );
        },
    };
}
