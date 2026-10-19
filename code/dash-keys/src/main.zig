const std = @import("std");
const Io = std.Io;
const debug = @import("std").debug;

const zig_test = @import("zig_test");
// const parser = @import("parser");
// const functools = @import("functools");
// const network = @import("znetwork");

// queue

pub fn main() !void {
    // pub fn main(init: std.process.Init) !void {
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
}

const GallAgentResult = struct { 
    @"on-init": []const u8,
    @"on-save": []const u8,
    @"on-load": []const u8,
    @"on-poke": []const u8,
    @"on-watch": []const u8,
    @"on-leave": []const u8,
    @"on-peek": []const u8,
    @"on-agent": []const u8,
    @"on-arvo": []const u8,
    @"on-fail": []const u8,
};

fn compiler(hoon: []const u8) GallAgentResult {
    // var re = try Regex.compile(std.heap.page_allocator, "\\|\\_\\s{2}(.*)\n(?=\\+\\+)(.*)");
    // defer re.deinit();

    // const compute_str = hoon;

    debug.print("enabler {s}\n", .{ hoon });
    return .{ .@"on-init" = "`..on-init", .@"on-save" = "!>(~)", .@"on-load" = "|=(vase `..on-init)", .@"on-poke" = "|=(cage !!)", .@"on-watch" = "|=(path !!)", .@"on-leave" = "|=(path `..on-init)", .@"on-peek" = "|=(path ~)", .@"on-agent" = "|=([wire sign:agent:gall] !!)", .@"on-arvo" = "|=([wire sign-arvo] !!)", .@"on-fail" = "|=([term tang] `..on-init)" };
}

test "running a js convert gall app" {

         const hoon = 
\\|_  =bowl:gall
\\++  on-init   `..on-init
\\++  on-save   !>(~)
\\++  on-load   |=(vase `..on-init)
\\++  on-poke   |=(cage !!)
\\++  on-watch  |=(path !!)
\\++  on-leave  |=(path `..on-init)
\\++  on-peek   |=(path ~)
\\++  on-agent  |=([wire sign:agent:gall] !!)
\\++  on-arvo   |=([wire sign-arvo] !!)
\\++  on-fail   |=([term tang] `..on-init)
\\--
;
 
    debug.print("arm 1: {s}\n", .{ compiler(hoon).@"on-init" });
}



test "simple test" {
    const gpa = std.testing.allocator;
    var list: std.ArrayList(f64) = .empty;
    defer list.deinit(gpa); // Try commenting this out and see if zig detects the memory leak!
    try list.append(gpa, 4.1);
    // try std.testing.expectEqual(@as(i32, 42), list.pop());
    std.debug.print("rip: {} ", .{list.pop().?});

}