const std = @import("std");
const net = std.Io.net;
const Io = std.Io;
const debug = @import("std").debug;
const Regex = @import("regex").Regex;

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    const addr = try net.IpAddress.parse("127.0.0.1", 8081);
    var server = try addr.listen(io, .{ .reuse_address = true });
    defer server.deinit(io);

    debug.print("Start HTTP server at {f}", .{addr});
}

test "match string in the middle example" {
    var re = try Regex.compile(std.heap.page_allocator, "ab(\\d+)");
    defer re.deinit();

    const compute_str = "xxxxab0123a";

    if (try re.captures(compute_str)) |caps| {

        const whole_match = caps.sliceAt(0).?; // "ab0123"
        const digits = caps.sliceAt(1).?;      // "0123"
        debug.print("whole match: {s}\n", .{ whole_match });
        debug.print("digits: {s}\n", .{ digits });
    }
}