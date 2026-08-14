// test "Connect to an echo server" {
//     try network.init();
//     defer network.deinit();

//     const sock = try network.connectToHost(std.heap.page_allocator, "tcpbin.com", 4242, .tcp);
//     defer sock.close();

//     const msg = "Hi from socket!\n";
//     try sock.writer().writeAll(msg);

//     var buf: [128]u8 = undefined;
//     std.debug.print("Echo: {}", .{buf[0..try sock.reader().readAll(buf[0..msg.len])]});
// }