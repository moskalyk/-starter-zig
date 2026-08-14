const std = @import("std");
const Io = std.Io;

const zig_test = @import("zig_test");
const parser = @import("parser");
// const functools = @import("functools");
// const network = @import("znetwork");

// queue

pub fn main() !void {
    // pub fn main(init: std.process.Init) !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    var tree = try parser.parse(std.heap.smp_allocator, "const x = 5;", .{});
    defer tree.deinit();

    for (tree.diagnostics.items) |d| {
        std.debug.print("{s}\n", .{d.message});
    }

    // // This is appropriate for anything that lives as long as the process.
    // const arena: std.mem.Allocator = init.arena.allocator();

    // // Accessing command line arguments:
    // const args = try init.minimal.args.toSlice(arena);
    // for (args) |arg| {
    //     std.log.info("arg: {s}", .{arg});
    // }

    // // In order to do I/O operations need an `Io` instance.
    // const io = init.io;

    // // Stdout is for the actual output of your application, for example if you
    // // are implementing gzip, then only the compressed bytes should be sent to
    // // stdout, not any debugging messages.
    // var stdout_buffer: [1024]u8 = undefined;
    // var stdout_file_writer: Io.File.Writer = .init(.stdout(), io, &stdout_buffer);
    // const stdout_writer = &stdout_file_writer.interface;

    // try zig_test.printAnotherMessage(stdout_writer);

    // try stdout_writer.flush(); // Don't forget to flush!
}

test "running a js parse test" {
    var tree = try parser.parse(std.heap.smp_allocator, "const x = 5;", .{});
    defer tree.deinit();

    for (tree.diagnostics.items) |d| {
        std.debug.print("{s}\n", .{d.message});
    }
}



test "simple test" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(i32) = .empty;
    defer list.deinit(gpa); // Try commenting this out and see if zig detects the memory leak!
    try list.append(gpa, 42);
    // try std.testing.expectEqual(@as(i32, 42), list.pop());
    std.debug.print("rip: {} ", .{list.pop().?});

}